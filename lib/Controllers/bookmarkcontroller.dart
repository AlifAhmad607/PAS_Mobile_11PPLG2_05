import 'package:get/get.dart';
import 'package:pas_mobile/Models/Tvmodel.dart';

class BookmarkController extends GetxController {
  var bookmarks = <TvshowModel>[].obs;

  void addBookmark(TvshowModel tv) {
    if (!bookmarks.contains(tv)) {
      bookmarks.add(tv);
      Get.snackbar('Success', '${tv.name} ditambahkan ke bookmark');
    }
  }

  void removeBookmark(TvshowModel tv) {
    bookmarks.remove(tv);
    Get.snackbar('Deleted', '${tv.name} dihapus dari bookmark');
  }
}
