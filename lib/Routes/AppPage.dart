import 'package:get/route_manager.dart';
import 'package:pas_mobile/Bindings/LoginBinding.dart';
import 'package:pas_mobile/Bindings/RegisterBinding.dart';
import 'package:pas_mobile/Bindings/Tvlistbinding.dart';
import 'package:pas_mobile/Page/HomePage.dart';
import 'package:pas_mobile/Page/LoginPage.dart';
import 'package:pas_mobile/Page/RegisterPage.dart';
import 'package:pas_mobile/Page/TvlistPage.dart';
import 'package:pas_mobile/Page/bookmarkpage.dart';
import 'package:pas_mobile/Page/profilePage.dart';
import 'package:pas_mobile/Routes/AppRoutes.dart';

class AppPage {
  static final pages = [
    GetPage(name: Approutes.home, page: ()=> HomePage()),
    GetPage(name: Approutes.login, page: ()=>  LoginPage(), binding: LoginAPIBinding()),
    GetPage(name: Approutes.register, page: ()=>  RegisterPage(), binding: RegisterBinding()),
    GetPage(name: Approutes.profile, page: ()=> ProfilePage()),
    GetPage(name: Approutes.tvlist, page: ()=> TvlistPage(), binding: TvlistBinding()),
    GetPage(name: Approutes.tvbookmark, page: ()=> BookmarkPage()),
  ];
}
