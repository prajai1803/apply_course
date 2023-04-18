import 'package:apply_course/app/core/values/apply_filter_dropdown_models.dart';
import 'package:apply_course/app/data/models/course_model.dart';
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  FirebaseProvider _firebaseProvider = FirebaseProvider();

  final coursesListPermanant = List<CourseModel>.empty(growable: true).obs;
  final coursesList = List<CourseModel>.empty(growable: true).obs;
  var isFilterLoading = false.obs;

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
  var isFilterCleared = true.obs;

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

  void filterSearch(value) async {
    coursesList.value = [];
    List<CourseModel> list = coursesListPermanant;
    printInfo(info: programLevel.value);
    if (value != "") {
      coursesList.value = list
          .where((element) =>
              (element.courseName!.toLowerCase().contains(value)) &&
              (method == "" ||
                  element.programMethod!.toLowerCase() ==
                      method.toLowerCase()) &&
              ((duration == "") ||
                  element.programLength!.toLowerCase() ==
                      duration.toLowerCase()) &&
              ((category == "") ||
                  element.category!.toLowerCase() == category.toLowerCase()) &&
              ((subCategory == "") ||
                  element.subCategory!.toLowerCase() ==
                      subCategory.toLowerCase()) &&
              ((location == "") ||
                  element.location!.toLowerCase() == location.toLowerCase()) &&
              ((fee == "") ||
                  element.location!.toLowerCase() == fee.toLowerCase()) &&
              ((programLevel == "") ||
                  element.programLevel!.toLowerCase() ==
                      programLevel.toLowerCase()))
          .toList();
    } else {
      printInfo(info: "yha a raha hai ki nahji");
      print(coursesListPermanant);
      coursesList.value = coursesListPermanant;
    }
  }

  void clearFilter() {
    print("heysdfsadfdsfsdsd");
    isFilterCleared.value = false;
    currentTabIndex.value = 0;
    programLevel.value = "";
    category.value = "";
    subCategory.value = "";
    method.value = "";
    location.value = "";
    duration.value = "";
    fee.value = "";
    changeCategory();
    
  }

  void changeCategory() {
    filterdList.value = ApplyFilterDropDownModels.list[currentTabIndex.value];
  }

  void inFilterSearch(String key) {
    var result = <String>[];
    if (filterSearchController.value.isEmpty) {
      result = ApplyFilterDropDownModels.list[currentTabIndex.value];
    } else {
      result = ApplyFilterDropDownModels.list[currentTabIndex.value]
          .where((element) => element.toLowerCase().contains(key))
          .toList();
    }
    filterdList.value = result;
  }

  void ApplyFilter() {}

  Future<void> getCourses() async {
    coursesList.value = [];
    List<CourseModel> list =
        await _firebaseProvider.getAllCourses();
    coursesListPermanant.value = list;
    coursesList.value = coursesListPermanant;
  }

  Future<void> reFreshCourse() async {
    isFilterLoading.value = true;
    coursesList.value = [];
    List<CourseModel> list = await _firebaseProvider.getAllCourses();
    coursesListPermanant.value = list;
    coursesList.value = list;
    isFilterLoading.value = false;
  }

}
