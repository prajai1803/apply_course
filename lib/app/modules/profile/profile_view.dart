import './profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/additional_information.dart';
import 'widgets/education.dart';
import 'widgets/expericence.dart';
import 'widgets/lor_details.dart';
import 'widgets/profile_card.dart';
import 'widgets/test_score.dart';
import 'widgets/your_study_prefrences.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});

  final _controller = Get.find<ProfileController>();
  final _height = ScreenUtil().screenHeight;
  final _width = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 245, 255),
      body: SafeArea(
        child:  Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 14.h),
          child: SingleChildScrollView(
            child: !_controller.isLoading.value ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Text("20 Action Pending",style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red[800]),),
                ),
                ProfileCard(),
                YourStudyPrefrences(),
                ExperienceWidget(),
                EducationWidget(),
                TestScoreWidget(),
                AdditionalInformationWidget(),
                LORDeailsWidget(),
              ],
            ) :  SizedBox(
              height: _height,
              child:const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}