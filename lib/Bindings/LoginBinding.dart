import 'package:get/get.dart';
import 'package:pas_mobile/Bindings/Tvlistbinding.dart';
import 'package:pas_mobile/Controllers/LoginController.dart';
import 'package:pas_mobile/Controllers/bookmarkcontroller.dart';


class LoginAPIBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logincontroller>(() => Logincontroller());
    Get.lazyPut<BookmarkController>(() => BookmarkController());

  }
}
