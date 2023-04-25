import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'profile_data_time.dart';
import 'profile_drop_down.dart';
import 'profile_text_field.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});

  final _controller = Get.find<ProfileController>();

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
                  child: ProfileTextField(
                    textEditingController: _controller.nameController,
                    hintText: "Name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    textEditingController: _controller.phoneNumberController,
                    hintText: "Phone No.",
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      ()=> ProfileDatePicker(
                        hintText: "Date Of Birth",
                        onTap: () async {
                          DateTime? piackedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2050));
                          _controller.dobController.value =  DateFormat('dd-MM-yyyy').format(piackedDate!);
                        },
                        date: _controller.dobController.value,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    textEditingController: _controller.locationController,
                    hintText: "Location",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDropDown(
                    data: const ["Male", "Female", "Trans"],
                    hintText: "Gender",
                    onChanged: (value) {
                      _controller.genderController.text = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDropDown(
                    data: const ["Married", "Unmarried"],
                    hintText: "Marital Status",
                    onChanged: (value) {
                      _controller.maritalStatusController.text = value;
                    },
                  ),
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
                        onPressed: () {
                          _controller.updateProfileCard();
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(
        () => Container(
          // height: 330.h,
          width: double.infinity,
          padding: EdgeInsets.all(14.r),
          child: !_controller.isLoadingProfileCard.value
              ? Column(
                  children: [
                    // part 1
                    Column(
                      children: [
                        Container(
                          height: 117.w,
                          width: 117.w,
                          // child: Image.asset("assets/get_started.png")
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Container(
                            height: 27.h,
                            color: Colors.grey[100],
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Add Picture",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // part 2
                    Column(
                      children: [
                        // name and edit button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_controller.user.displayName ?? "No Name",
                                style: Theme.of(context).textTheme.titleLarge),
                            IconButton(
                                onPressed: () {
                                  _controller.getEditData();
                                  _addData(context);
                                },
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 25.r,
                                  color: Colors.blue,
                                ))
                          ],
                        ),
                        // Profile status and percentage
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Profile Status",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Text(
                                _controller.user.profileStatus == null
                                    ? "0%"
                                    : _controller.user.profileStatus!
                                        .toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: StepProgressIndicator(
                            totalSteps: 100,
                            currentStep: 33,
                            size: 5,
                            padding: 0,
                            selectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.blue[900]!.withOpacity(.5),
                                Colors.blue[900]!
                              ],
                            ),
                            unselectedColor: Colors.blue.withOpacity(.2),
                          ),
                        ),
                        // Email and Phone Number
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 14.r,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.w, right: 10.w),
                                    child: Text(
                                      _controller.user.email ?? "No Email",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.phone_android_outlined,
                                    size: 14.r,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(
                                        _controller.user.phoneNumber == null
                                            ? "No Number"
                                            : _controller.user.phoneNumber!
                                                .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14.r,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.w, right: 10.w),
                                    child: Text(
                                      _controller.user.location ?? "No location",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    size: 14.r,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(_controller.user.dob ?? "No date of birth",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 14.r,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.w, right: 10.w),
                                    child: Text(
                                      _controller.user.gender ?? "No Gender",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.group,
                                    size: 14.r,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(_controller.user.maritalStatus?? "No Marital Status",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
