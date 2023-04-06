import 'package:apply_course/app/data/models/course_model.dart';
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseProvider _firebaseProvider = FirebaseProvider();

  final coursesList = <CourseModel>[].obs;

  // Apply Filter
  final currentTabIndex = 0.obs;
  final programLevel = "".obs;
  final category = "".obs;
  final subCategory = "".obs;
  final method = "".obs;
  final location = "".obs;
  final duration = "".obs;
  final fee = "".obs;

  final listOfFilter = [
    "Program Level",
    "Category",
    "Sub-Category",
    "Method",
    "Location",
    "Duration",
    "Fee",
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    getCourses();
    super.onInit();
  }

  // Apply Filter Methods
  getListName(int index) {
    switch (index) {
      case 0:
        return programLevel;
      case 1:
        return category;
      case 2:
        return subCategory;
      case 3:
        return method;
      case 4:
        return location;
      case 5:
        return duration;
      case 6:
        return fee;
    }
  }

  void getCourses() async {
    List<CourseModel> list = await _firebaseProvider.getAllCourses();
    coursesList.value = list;
  }
}
