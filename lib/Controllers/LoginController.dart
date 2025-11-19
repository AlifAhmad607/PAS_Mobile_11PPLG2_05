import 'dart:convert';

import 'package:get/get.dart';
import 'package:pas_mobile/Models/Login.dart';
import 'package:pas_mobile/Page/HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Logincontroller extends GetxController{
  var isLoading = false.obs;  
  var message = ''.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  

  Future<void> login(String username, String password) async {
    try {
      isLoading.value = true;

      var url = Uri.parse("https://mediadwi.com/api/latihan/login");
      var response = await http.post(url, body: {
        'username': username,
        'password': password,
      });

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == true) {
        LoginApi model = LoginApi.fromJson(data);

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("token", model.token);

        Get.snackbar("Success", "Sukses Login");
        Get.offAll(() =>  HomePage());
      } else {
        Get.snackbar("Error", data["message"] ?? "Login gagal");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("isLoggedIn");
    await prefs.remove("loginType");
    await prefs.remove("token");
    await prefs.remove("name");

    userName.value = "";
    userEmail.value = "";
    

    Get.offAllNamed('/login');
  }
}