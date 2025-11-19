import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/Navcontroller.dart';
import 'package:pas_mobile/Controllers/profileController.dart';


class Mainmenubindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
     
     Get.lazyPut<Profilecontroller>(()=>Profilecontroller());
     Get.lazyPut<NavController>(()=>NavController());
      
  }
  
}