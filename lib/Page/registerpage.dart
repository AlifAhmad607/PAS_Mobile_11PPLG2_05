import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/RegisterController.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>(); // <-- inisialisasi controller
    final userC = TextEditingController();
    final passC = TextEditingController();
    final emailC = TextEditingController(); // tambahan email

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userC,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailC,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passC,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if(userC.text.isEmpty || passC.text.isEmpty || emailC.text.isEmpty){
                        Get.snackbar("Error", "Semua field wajib diisi");
                        return;
                      }
                      controller.register(userC.text, passC.text, emailC.text); // <-- sekarang valid
                    },
                    child: const Text("Register"),
                  )),
          ],
        ),
      ),
    );
  }
}

