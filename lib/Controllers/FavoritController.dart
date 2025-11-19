import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Models/Tvmodel.dart';

class FavoritController extends GetxController {
  final box = GetStorage();
  var bookmarks = <TvshowModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  void loadBookmarks() {
    if (box.read("bookmarks") != null) {
      bookmarks.value = (box.read("bookmarks") as List)
          .map((e) => TvshowModel.fromJson(e))
          .toList();
    }
  }

  bool isBookmarked(int id) {
    return bookmarks.any((item) => item.id == id);
  }

  void toggleBookmark(TvshowModel model) {
    if (isBookmarked(model.id)) {
      bookmarks.removeWhere((item) => item.id == model.id);
    } else {
      bookmarks.add(model);
    }
    box.write("bookmarks", bookmarks.map((e) => e.toJson()).toList());
  }
}
