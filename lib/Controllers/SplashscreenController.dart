import 'package:get/get.dart';
import 'package:pas_mobile/Routes/AppRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }

  checklogin() async {
    await Future.delayed(Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("token") != null) {
      Get.offAllNamed(Approutes.home);
    } else {
      Get.offAllNamed(Approutes.login);
    }
  }
}