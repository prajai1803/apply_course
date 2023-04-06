import 'package:apply_course/app/routes/pages.dart';
import 'package:apply_course/app/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const ApplyCourse());
}

class ApplyCourse extends StatelessWidget {
  const ApplyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  GetMaterialApp(
        title: "Apply Course",
        initialRoute: AppRoutes.loginScreen,
        getPages: AppPages.pages,        
      ),
    );
  }
}
