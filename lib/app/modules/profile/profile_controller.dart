import 'package:apply_course/app/data/models/user_model.dart';
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:apply_course/app/data/providers/storage_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  final StorageProvider _storageProvider = StorageProvider();
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  late UserModel user;

  // Loading and State management
  RxBool isLoading = false.obs;
  RxBool isLoadingProfileCard = false.obs;
  RxBool isLoadingStudyPrefrences = false.obs;

  int profileStatus = 0;

  // Form Text Fields

  // profile
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController locationController;
  RxString dobController = ''.obs;
  late TextEditingController genderController;
  late TextEditingController maritalStatusController;

  // study Prefrence
  late TextEditingController courseLevel;
  late TextEditingController countryPrefrence;
  late TextEditingController preferredCourse;
  late TextEditingController specialization;
  late TextEditingController inTake;
  RxString inTakeObs = "".obs;
  late TextEditingController budget;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    getUserData();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getUserData() async {
    user = await _storageProvider.readUserModel();
    isLoading.value = false;
    print(user.studyPrefrences!.courseLevel);
  }

  // Assign when we open add dialogue
  void getEditData() {
    // initialize when it call
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    locationController = TextEditingController();
    genderController = TextEditingController();
    maritalStatusController = TextEditingController();

    // assigning data
    nameController.text = user.displayName ?? "";
    phoneNumberController.text = user.phoneNumber ?? "";
    locationController.text = user.location ?? "";
    dobController.value = user.dob ?? "";
    genderController.text = user.gender ?? "";
    maritalStatusController.text = user.maritalStatus ?? "";
  }

  void getEditStudyPrefrenceData() {
    courseLevel = TextEditingController();
    countryPrefrence = TextEditingController();
    preferredCourse = TextEditingController();
    specialization = TextEditingController();
    budget = TextEditingController();
    inTake = TextEditingController();

    print(user.studyPrefrences!.budget.toString());
    if (user.studyPrefrences != null) {
      courseLevel.text = user.studyPrefrences!.courseLevel ?? "";
      countryPrefrence.text = user.studyPrefrences?.countryPrefrences ?? "";
      preferredCourse.text = user.studyPrefrences?.preferredCourse ?? "";
      specialization.text = user.studyPrefrences?.specialization ?? "";
      budget.text = user.studyPrefrences!.budget.toString();
      inTake.text = user.studyPrefrences!.inTake ?? "";
    }
  }

  void updateProfileCard() async {
    Get.back();
    isLoadingProfileCard.value = true;
    var success = await _firebaseProvider.updateProfile(user.copyWith(
      displayName: nameController.text == "" ? null : nameController.text,
      phoneNumber:
          phoneNumberController.text == "" ? null : phoneNumberController.text,
      location: locationController.text == "" ? null : locationController.text,
      dob: dobController.value == "" ? null : dobController.value,
      gender: genderController.text == "" ? null : genderController.text,
      maritalStatus: maritalStatusController.text == ""
          ? null
          : maritalStatusController.text,
    ));
    getUserData();
    if (success) {
      isLoadingProfileCard.value = false;
      Get.snackbar("Successfull", "Updated the profile");
    } else {
      isLoadingProfileCard.value = false;
    }
  }

  void updateStudyPrefrences() async {
    Get.back();
    isLoadingStudyPrefrences.value = true;
    int? tempBudget = int.tryParse(budget.text);
    print(courseLevel.text);
    var success = await _firebaseProvider.updateProfile(user.copyWith(
      studyPrefrences: StudyPrefrences(
        courseLevel: courseLevel.text.isEmpty ? null : courseLevel.text,
        countryPrefrences:
            countryPrefrence.text.isEmpty ? null : countryPrefrence.text,
        preferredCourse:
            preferredCourse.text.isEmpty ? null : preferredCourse.text,
        specialization:
            specialization.text.isEmpty ? null : specialization.text,
        budget: budget.text.isEmpty ? null : tempBudget,
        inTake: inTake.text.isEmpty ? null : inTake.text,
      ),
    ));
    getUserData();
    if (success) {
      isLoadingStudyPrefrences.value = false;
      Get.snackbar("Successfull", "Updated the profile");
    } else {
      isLoadingStudyPrefrences.value = false;
    }
  }
}
