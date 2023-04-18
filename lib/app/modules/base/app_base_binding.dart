import 'package:apply_course/app/modules/base/appbase_controller.dart';
import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';

class AppbaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppBaseController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
  }
}