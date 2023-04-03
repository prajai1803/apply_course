import 'dart:async';
import 'package:get/get.dart';


class SplashController extends GetxController {
  // UserModel? user;
  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
