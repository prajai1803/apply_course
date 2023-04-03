import 'package:apply_course/app/modules/authentication/login_page.dart';
import 'package:apply_course/app/modules/base/app_base.dart';
import 'package:apply_course/app/modules/home/home_page_view.dart';
import 'package:get/get.dart';
import '../modules/authentication/auth_bindings.dart';
import '../modules/slpash_screen/binding.dart';
import '../modules/slpash_screen/view.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashScreen, page: ()=> SplashScreen(),binding: SplashBinding()),
    GetPage(name: AppRoutes.loginScreen, page: ()=> LoginScreen(),binding: AuthBinding()),
    GetPage(name: AppRoutes.homeScreen, page: ()=> HomeScreen(),binding: AuthBinding()),
    GetPage(name: AppRoutes.appBaseScreen, page: ()=> AppBase(),transition: Transition.fadeIn),
  ];
}