import 'dart:async';
import 'package:apply_course/app/routes/routes.dart';
import 'package:get/get.dart';

import '../../data/models/user_model.dart';
import '../../data/providers/storage_provider.dart';

class SplashController extends GetxController {
  // UserModel? user;
  late Timer _timer;
  @override
  void onInit() {
    _timer = Timer(Duration(seconds: 3), () {
      _validateAuthentication();
    });
    super.onInit();
  }

  void _validateAuthentication() async {
    StorageProvider _storage = StorageProvider();
    try {
      UserModel userModel = await _storage.readUserModel();
      if (userModel.emailVerified ?? false) {
        Get.offAllNamed(AppRoutes.appBaseScreen);
      } else {
        Get.offAllNamed(AppRoutes.loginScreen);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
