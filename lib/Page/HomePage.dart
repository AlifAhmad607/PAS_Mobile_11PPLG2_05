import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/Bindings/home%5Bpagebinding.dart';
import 'package:pas_mobile/Page/TvlistPage.dart';
import 'package:pas_mobile/Page/BookmarkPage.dart';
import 'package:pas_mobile/Page/ProfilePage.dart';
import '../Controllers/NavController.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NavController navController = Get.put(NavController());

  final HomeBinding _homeBinding = HomeBinding(); 

  final List<Widget> pages = [
    ProfilePage(),
    TvlistPage(),
    BookmarkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _homeBinding.dependencies(); 

    return Obx(() => Scaffold(
      body: pages[navController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changePage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV List'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
        ],
      ),
    ));
  }
}
