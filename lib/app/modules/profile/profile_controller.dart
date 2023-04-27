import 'dart:io';
import 'package:apply_course/app/data/models/user_model.dart';
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:apply_course/app/data/providers/storage_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final StorageProvider _storageProvider = StorageProvider();
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  late UserModel user;

  // Add Picture Controller
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Loading and State management
  RxBool isLoading = false.obs;
  RxBool isLoadingProfileCard = false.obs;
  RxBool isLoadingStudyPrefrences = false.obs;
  RxBool isLoadingExperience = false.obs;
  RxBool isLoadingAdditionalInformation = false.obs;
  RxBool isLoadingLORDetails = false.obs;

  int profileStatus = 0;

  // For pickingImage
  XFile? pickedFile;
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

  // Experience
  late TextEditingController experiencejobRole;
  late TextEditingController experienceCompanyName;
  late TextEditingController experienceStartedDate;
  late TextEditingController experienceEndedDate;
  late TextEditingController experiencejobDescription;

  // Additional Information
  late TextEditingController additionalCantactName;
  late TextEditingController additionalCantactNumber;
  late TextEditingController additionalEmail;
  late TextEditingController additionalRelastionship;
  late TextEditingController additionalMailingAddress;
  late TextEditingController additionalPermanentAddress;

  // Lor details page
  late TextEditingController lorContactName;
  late TextEditingController lorContactNumber;
  late TextEditingController lorEmail;
  late TextEditingController recommededBy;
  late TextEditingController lorJobRole;
  late TextEditingController lorCompanyName;
  late TextEditingController postalAddress;

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

  void uploadImage() async {
    isLoadingProfileCard.value = true;
    var url =
        await _firebaseProvider.uploadImage(user.uid, File(pickedFile!.path));
    if (url != 'null') {
      var success =
          await _firebaseProvider.updateProfile(user.copyWith(photoUrl: url));
      getUserData();
      if (success) {
        isLoadingProfileCard.value = false;
        selectedImagePath.value = '';
        Get.snackbar("Success", "");
      } else {
        isLoadingProfileCard.value = false;
        selectedImagePath.value = '';
      }
    }
  }

  void getImage() async {
    pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 20);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile!.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      print(selectedImageSize);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void getUserData() async {
    user = await _storageProvider.readUserModel();
    isLoading.value = false;
    print(user.experience!.listOfJobs!);
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

  void getAdditionalInformationEdit() {
    additionalCantactName = TextEditingController();
    additionalCantactNumber = TextEditingController();
    additionalEmail = TextEditingController();
    additionalRelastionship = TextEditingController();
    additionalMailingAddress = TextEditingController();
    additionalPermanentAddress = TextEditingController();

    if (user.additionalInformation != null) {
      additionalCantactName.text =
          user.additionalInformation!.contactName ?? "";
      additionalCantactNumber.text =
          user.additionalInformation!.contactNumber ?? "";
      additionalEmail.text = user.additionalInformation!.email ?? "";
      additionalRelastionship.text =
          user.additionalInformation!.relationshipWithApplicant ?? "";
      additionalMailingAddress.text =
          user.additionalInformation!.mailingAdress ?? "";
      additionalPermanentAddress.text =
          user.additionalInformation!.permanentAddress ?? "";
    }
  }

  void getLORDetailsEdit() {
    lorContactName = TextEditingController();
    lorContactNumber = TextEditingController();
    lorEmail = TextEditingController();
    recommededBy = TextEditingController();
    lorJobRole = TextEditingController();
    lorCompanyName = TextEditingController();
    postalAddress = TextEditingController();

    if (user.lorDetails != null) {
      lorContactName.text = user.lorDetails!.name ?? "";
      lorContactNumber.text = user.lorDetails!.contactNumber ?? "";
      lorEmail.text = user.lorDetails!.email ?? "";
      lorJobRole.text = user.lorDetails!.jobRole ?? "";
      recommededBy.text = user.lorDetails!.recommededBy ?? "";
      lorCompanyName.text = user.lorDetails!.companyName ?? "";
      postalAddress.text = user.lorDetails!.postalAddress ?? "";
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

  void updateExperience() async {
    Get.back();
    isLoadingExperience.value = true;
    List<Job> tempList = [];
    if (user.experience != null) {
      tempList = user.experience!.listOfJobs ?? [];
    }
    experiencejobRole = TextEditingController();
    experienceCompanyName = TextEditingController();
    experienceStartedDate = TextEditingController();
    experienceEndedDate = TextEditingController();
    experiencejobDescription = TextEditingController();
    // tempList.add(Job(
    //   jobRole: experiencejobRole.text.isEmpty ? null : experiencejobRole.text,
    //   companyName: experienceCompanyName.text.isEmpty ? null : experienceCompanyName.text,
    //   startedData: experienceStartedDate.text.isEmpty ? null : experienceCompanyName.text,
    //   endedData: experienceEndedDate.text.isEmpty ? null : experienceEndedDate.text,
    //   jobDescription: experiencejobDescription.text.isEmpty ? null : experiencejobDescription.text,
    // ));
    var success = await _firebaseProvider.updateProfile(
        user.copyWith(experience: Experience(listOfJobs: tempList)));
    getUserData();
    if (success) {
      isLoadingExperience.value = false;
      Get.snackbar("Successfull", "Updated the profile");
    } else {
      isLoadingExperience.value = false;
    }
  }

  void updateAdditionalInformation() async {
    Get.back();
    isLoadingAdditionalInformation.value = true;
    var success = await _firebaseProvider.updateProfile(user.copyWith(
      additionalInformation: AdditionalInformation(
        contactName: additionalCantactName.text.isEmpty
            ? null
            : additionalCantactName.text,
        contactNumber: additionalCantactNumber.text.isEmpty
            ? null
            : additionalCantactNumber.text,
        email: additionalEmail.text.isEmpty ? null : additionalEmail.text,
        relationshipWithApplicant: additionalRelastionship.text.isEmpty
            ? null
            : additionalRelastionship.text,
        mailingAdress: additionalMailingAddress.text.isEmpty
            ? null
            : additionalMailingAddress.text,
        permanentAddress: additionalPermanentAddress.text.isEmpty
            ? null
            : additionalPermanentAddress.text,
      ),
    ));
    getUserData();
    if (success) {
      isLoadingAdditionalInformation.value = false;
      Get.snackbar("Successfull", "Updated the profile");
    } else {
      isLoadingAdditionalInformation.value = false;
    }
  }
}
