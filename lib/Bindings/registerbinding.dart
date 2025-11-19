import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/RegisterController.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
