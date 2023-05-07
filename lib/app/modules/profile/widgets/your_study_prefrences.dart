import 'package:apply_course/app/core/values/apply_filter_dropdown_models.dart';
import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'profile_data_time.dart';
import 'profile_drop_down.dart';
import 'profile_text_field.dart';

class YourStudyPrefrences extends StatelessWidget {
  YourStudyPrefrences({super.key});

  final _controller = Get.find<ProfileController>();
  final _height = ScreenUtil().screenHeight;
  final _width = ScreenUtil().screenWidth;

  void _addData(context) {
    Get.defaultDialog(
      title: "Profile Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 300.h,
          child: SingleChildScrollView(
            child: Form(
              key: _controller.profileEditFormKey,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProfileDropDown(
                        data: ApplyFilterDropDownModels.listOfLevel,
                        hintText: "Course Level",
                        validator: (value) {
                          if (value == null || value == ""){
                            return 'select any course';
                          }
                        },                        
                        onChanged: (value) {
                          _controller.courseLevel.text = value;
                          _controller.profileEditFormKey.currentState!.validate();
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileDropDown(
                      data: [
                        "India",
                        "USA"
                      ],
                      onChanged: (value) {
                        _controller.countryPrefrence.text = value;
                        _controller.profileEditFormKey.currentState!.validate();
                      },
                      validator: (value) {
                          if (value == null || value == ""){
                            return 'select any country';
                          }
                        },
                      hintText: "Country Prefrences",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileDropDown(
                      data: [
                        "Arts",
                        "Engineering",
                        "Business Management"
                      ],
                      onChanged: (value) {
                        _controller.preferredCourse.text = value;
                        _controller.profileEditFormKey.currentState!.validate();
                      },
                      validator: (value) {
                          if (value == null || value == ""){
                            return 'select any course';
                          }
                        },
                      hintText: "Preferred Course",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileDropDown(
                      data: const [
                        "Computer Science",
                      ],
                      onChanged: (value) {
                        _controller.specialization.text = value;
                        _controller.profileEditFormKey.currentState!.validate();
                      },
                      validator: (value) {
                          if (value == null || value == ""){
                            return 'select any branches';
                          }
                        },
                      hintText: "Specialization",
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => ProfileDatePicker(
                          hintText: "In Take",
                          controller: _controller.inTake,
                          validator: (value) {
                            print(value);
                            if(value == null || value == ''){
                              return 'pick date';
                            }
                          },
                          onTap: () async {
                            DateTime? piackedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2050));
                            _controller.inTakeObs.value =
                                DateFormat('dd-MM-yyyy').format(piackedDate!);
                            _controller.inTake.text = DateFormat('dd-MM-yyyy').format(piackedDate);
                            print(_controller.inTake.text);
                            _controller.profileEditFormKey.currentState!.validate();
                          },
                          date: _controller.inTakeObs.value,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProfileTextField(
                        hintText: "Budget",
                        isNumPad: true,
                        validator: (value) {
                          if (value == null || value == ""){
                            return 'select buget';
                          }
                        },
                        textEditingController: _controller.budget,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: Theme.of(context).textTheme.titleSmall,
                          )),
                      ElevatedButton(
                          onPressed: () {
                            _controller.updateStudyPrefrences();
                          },
                          child: Text(
                            "Save",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(
        ()=> Container(
          // height: 351.h,
          margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Column(
            children: [
              // Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Study Prefrences",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  _controller.user.studyPrefrences != null
                      ? IconButton(
                          onPressed: () {
                            _controller.getEditStudyPrefrenceData();
                            _addData(context);
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 25.r,
                            color: Colors.blue,
                          ))
                      : Container(),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              // course level and country
             (_controller.user.studyPrefrences != null && !_controller.isLoadingStudyPrefrences.value)
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: _width * .4,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.book,
                                      color: Colors.green,
                                      size: 25.r,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 150.w,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Course Level",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h),
                                              child: Text(
                                                _controller.user.studyPrefrences!.courseLevel ?? "No Data",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.locationCrosshairs,
                                      color: Colors.blue,
                                      size: 25.r,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 150.w,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Country Prefrences",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h),
                                              child: Text(
                                                _controller.user.studyPrefrences!.countryPrefrences ?? "No Data",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Prefered course and Specialization
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: _width * .4,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.bookAtlas,
                                      color: Colors.purple,
                                      size: 25.r,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 150.w,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Preferred Course",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h),
                                              child: Text(
                                                _controller.user.studyPrefrences!.preferredCourse ?? "No Data",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.person,
                                      color: Colors.orange,
                                      size: 25.r,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 150.w,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Specialization",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h),
                                              child: Text(
                                                _controller.user.studyPrefrences!.specialization ?? "No Data",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.cyan,
                                size: 25.r,
                              ),
                              Expanded(
                                child: Container(
                                  width: 150.w,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "In-Take",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.h),
                                        child: Text(
                                          _controller.user.studyPrefrences!.inTake ?? "No Data",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FontAwesomeIcons.wallet,
                                color: Colors.brown,
                                size: 25.r,
                              ),
                              Expanded(
                                child: Container(
                                  width: 150.w,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Budget",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 2.h),
                                        child: Text(
                                          _controller.user.studyPrefrences!.budget.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : (_controller.user.studyPrefrences == null && !_controller.isLoadingStudyPrefrences.value) ? Container(
                      // height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          _controller.getEditStudyPrefrenceData();
                          _addData(context);
                        },
                        child: Text(
                          "Add Study Prefrence",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.red),
                        ),
                      ),
                    ) : Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
