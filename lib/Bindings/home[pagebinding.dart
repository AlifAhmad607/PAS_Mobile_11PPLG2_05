import 'package:get/get.dart';
import '../Controllers/TvlistController.dart';
import '../Controllers/bookmarkcontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvlistController>(() => TvlistController());
    Get.lazyPut<BookmarkController>(() => BookmarkController());
  }
}
