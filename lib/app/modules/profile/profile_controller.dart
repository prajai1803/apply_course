import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {

  int profileStatus = 0;

  // Form Text Fields

  // profile 
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController locationTextController = TextEditingController();
  RxString dobTextController = "".obs;
  TextEditingController genderTextController = TextEditingController();
  TextEditingController maritalStatusTextController = TextEditingController();

  // profile 
  RxString courseLevel = "".obs;
  RxString countryPrefrence = "".obs;
  RxString preferredCourse = "".obs;
  RxString specialization = "".obs;
  RxString inTake = "".obs;
  RxString budget = "".obs;




  





  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  
}