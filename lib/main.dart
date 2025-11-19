import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pas_mobile/Routes/AppPage.dart';
import 'package:pas_mobile/Routes/AppRoutes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BottomNav GetX',
      debugShowCheckedModeBanner: false,
      initialRoute: Approutes.login, 
      getPages: AppPage.pages,     
    );
  }
}
