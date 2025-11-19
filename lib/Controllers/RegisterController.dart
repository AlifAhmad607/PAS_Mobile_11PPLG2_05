import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:pas_mobile/Models/register.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> register(String username, String password, String email) async {
    try {
      isLoading.value = true;

      var url = Uri.parse("https://mediadwi.com/api/latihan/register-user");
      var response = await http.post(url, body: {
        'username': username,
        'password': password,
        'email': email,
      });

      var data = jsonDecode(response.body);
      Registermodel model = Registermodel.fromJson(data);

      if (response.statusCode == 200 && model.status) {
        Get.snackbar("Success", model.message);
        Get.back(); // kembali ke halaman login
      } else {
        Get.snackbar("Error", model.message);
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
