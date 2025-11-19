import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/bookmarkcontroller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkController>(() => BookmarkController());
  }
}
