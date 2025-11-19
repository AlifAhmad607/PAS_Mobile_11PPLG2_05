import 'dart:convert';

import 'package:get/get.dart';
import 'package:pas_mobile/Models/Tvmodel.dart';
import 'package:http/http.dart' as http;


class TvlistController extends GetxController{
  var tvlist = <TvshowModel>[].obs; 
  var isLoading = false.obs;

  Future <void>fetchTv()async{
    try{
      isLoading.value = true;
      final url = Uri.parse('https://api.tvmaze.com/shows');
      final res = await http.get(url);
      if (res.statusCode == 200){
        final  json = jsonDecode(res.body);
        tvlist.value = json['result']??[];
      }else{
        tvlist.value = [];
        Get.snackbar('Error', 'Gagal mengambil data Tv: ${res.statusCode}');
      }
    }catch(e){
      tvlist.value = [];
      Get.snackbar('error', 'Terjadi kesalahan saat fetch Tv');
    }finally{
      isLoading.value = false;
    }
  }
}