import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/Navcontroller.dart';
import 'package:pas_mobile/Page/TvlistPage.dart';
import 'package:pas_mobile/Page/profilePage.dart';

class HomePage extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [

    ProfilePage(),
    TvlistPage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: pages[navController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changePage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Tv'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    ));
  }
}