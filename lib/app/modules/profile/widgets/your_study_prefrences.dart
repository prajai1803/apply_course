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
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileDropDown(
                      data: ApplyFilterDropDownModels.listOfLevel,
                      hintText: "Course Level",
                      onChanged: (value) {
                        // _controller.courseLevel.value = value;
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDropDown(
                    data: [
                      "India",
                    ],
                    onChanged: (value) {
                      _controller.countryPrefrence.value = value;
                    },
                    hintText: "Country Prefrences",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDropDown(
                    data: [
                      "India",
                    ],
                    onChanged: (value) {
                      _controller.countryPrefrence.value = value;
                    },
                    hintText: "Preferred Course",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDropDown(
                    data: [
                      "India",
                    ],
                    onChanged: (value) {
                      _controller.countryPrefrence.value = value;
                    },
                    hintText: "Specialization",
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      ()=> ProfileDatePicker(
                        hintText: "In Take",
                        onTap: () async {
                          DateTime? piackedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2050));
                          _controller.dobTextController.value =  DateFormat('dd-mm-yy').format(piackedDate!);
                          
                        },
                        date: _controller.dobTextController.value,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(hintText: "Budget",isNumPad: true,onChanged: (value) {
                    _controller.budget = value;
                  },)
                ),
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
                        onPressed: () {},
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
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
                IconButton(
                    onPressed: () {
                      _addData(context);
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 25.r,
                      color: Colors.blue,
                    ))
              ],
            ),
            Divider(
              thickness: 2,
            ),
            // course level and country
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
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Course Level",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: Text(
                                    "Master",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Conuntry Prefrences",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: Text(
                                    "India",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Preferred Course",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: Text(
                                    "Engineering",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Specialization",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: Text(
                                    "Computer Science & Engineering",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text(
                              "Jun to July - 2024",
                              style: Theme.of(context).textTheme.bodySmall,
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
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text(
                              "Add Budget",
                              style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}
