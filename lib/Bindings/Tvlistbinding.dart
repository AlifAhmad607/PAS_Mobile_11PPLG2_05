import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/LoginController.dart';
import 'package:pas_mobile/Controllers/TvlistController.dart';


class Tvlistbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvlistController>(() => TvlistController());
  }
}
