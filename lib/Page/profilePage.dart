import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/LoginController.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // ambil controller login
  final Logincontroller loginC = Get.find<Logincontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username: ${loginC.userName.value}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Email: ${loginC.userEmail.value}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                loginC.signOut(); // logout
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
