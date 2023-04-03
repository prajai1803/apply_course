import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
  
}