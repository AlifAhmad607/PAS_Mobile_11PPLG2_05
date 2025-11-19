import 'dart:convert';
import 'package:get/get.dart';
import 'package:pas_mobile/Models/Tvmodel.dart';
import 'package:http/http.dart' as http;

class TvlistController extends GetxController {
  var tvlist = <TvshowModel>[].obs;
  var isLoading = false.obs;

  Future<void> fetchTv() async {
    try {
      isLoading.value = true;
      final url = Uri.parse('https://api.tvmaze.com/shows');
      final res = await http.get(url);

      if (res.statusCode == 200) {
        tvlist.value = tvshowModelFromJson(res.body);
      } else {
        tvlist.value = [];
        Get.snackbar('Error', 'Gagal mengambil data Tv: ${res.statusCode}');
      }
    } catch (e) {
      tvlist.value = [];
      Get.snackbar('Error', 'Terjadi kesalahan saat fetch Tv: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
