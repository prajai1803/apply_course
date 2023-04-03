import 'package:apply_course/app/data/models/course_model.dart';
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{
  
  FirebaseProvider _firebaseProvider = FirebaseProvider();

  List<CourseModel> coursesList = List.empty(growable: true);


  // Apply Filter 
  final currentTabIndex = 0.obs;
  final department = "".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getCourses() async{
    coursesList = await _firebaseProvider.getAllCourses();
  }
}