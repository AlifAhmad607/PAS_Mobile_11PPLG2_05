import 'package:http/http.dart' as http;
import 'package:pas_mobile/Models/register.dart';
import 'dart:convert';


class ApiService {
  static Future<Registermodel> register(
      String fullName, String username, String email, String password) async {

    final uri = Uri.parse('https://mediadwi.com/api/latihan/register-user');

    final response = await http.post(
      uri,
      body: {
        "full_name": fullName,
        "username": username,  
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      return registermodelFromJson(response.body);
    } else {
      throw Exception(
          "Failed to register | Status: ${response.statusCode}\nBody: ${response.body}");
    }
  }
}
