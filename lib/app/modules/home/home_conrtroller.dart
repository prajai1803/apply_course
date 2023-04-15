import 'package:apply_course/app/core/values/apply_filter_dropdown_models.dart';
import 'package:apply_course/app/data/models/course_model.dart';
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  FirebaseProvider _firebaseProvider = FirebaseProvider();

  // final coursesList = <CourseModel>[].obs;
  final coursesList = List<CourseModel>.empty(growable: true).obs;


  // Apply Filter
  final currentTabIndex = 0.obs;
  final programLevel = "".obs;
  final category = "".obs;
  final subCategory = "".obs;
  final method = "".obs;
  final location = "".obs;
  final duration = "".obs;
  final fee = "".obs;
  final filterSearchController = "".obs;
  var filterdList = <String>[].obs;

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
    filterdList.value = ApplyFilterDropDownModels.list[currentTabIndex.value];
    super.onInit();
  }
  
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    coursesList.clear();
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

  void changeCategory() {
    filterdList.value = ApplyFilterDropDownModels.list[currentTabIndex.value];
  }

  void inFilterSearch(String key) {
    var result = <String>[];
    if (filterSearchController.value.isEmpty) {
      result = ApplyFilterDropDownModels.list[currentTabIndex.value];
    }else {
      result = ApplyFilterDropDownModels.list[currentTabIndex.value].where((element) => element.toLowerCase().contains(key)).toList();
    }
    filterdList.value = result;
    print(filterdList.value);
  }


  void getCourses() async {
    coursesList.value = [];
    List<CourseModel> list = await _firebaseProvider.getAllCourses();
    coursesList.value = list;
  }

  Future<void> reFreshCourse() async{
    coursesList.value = [];
    List<CourseModel> list = await _firebaseProvider.getAllCourses();
    coursesList.value = list;
  }

  void search(String key) async{
    coursesList.value = [];
    List<CourseModel> list = await _firebaseProvider.getAllCourses();
    coursesList.value = list.where((element) => element.courseName!.toLowerCase() == key).toList();

  }
}
