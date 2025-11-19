import 'package:get/get.dart';
import 'package:pas_mobile/Bindings/Tvlistbinding.dart';
import 'package:pas_mobile/Controllers/LoginController.dart';


class LoginAPIBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<Tvlistbinding>(()=>Tvlistbinding());
    Get.lazyPut<Logincontroller>(() => Logincontroller());
  }
}
