import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'profile_data_time.dart';
import 'profile_text_field.dart';

class ExperienceWidget extends StatelessWidget {
  ExperienceWidget({super.key});

  final _controller = Get.find<ProfileController>();

  void _addWorkExperience(context) {
    Get.defaultDialog(
      title: "Experience Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 105.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Total Work Experience",
                    isNumPad: true,
                    textEditingController: _controller.totalWorkExperience,
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
                          _controller.updateTotalWorkExperience();
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

  void _addData(context) {
    Get.defaultDialog(
      title: "Experience Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 250.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Jobs Role",
                    textEditingController: _controller.experiencejobRole,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Company Name",
                    textEditingController: _controller.experienceCompanyName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDatePicker(
                    hintText: "Start Date",
                    controller: _controller.experienceStartedDate,
                    onTap: () async {
                      DateTime? piackedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                          _controller.experienceStartedDateObs.value = DateFormat('dd-MM-yy').format(piackedDate!);
                      _controller.experienceStartedDate.text =  DateFormat('dd-MM-yy').format(piackedDate);
                      
                    },
                    date: _controller.experienceStartedDateObs.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDatePicker(
                    hintText: "End Date",
                    controller: _controller.experienceEndedDate,
                    onTap: () async {
                      DateTime? piackedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                        _controller.experienceEndedDateObs.value = DateFormat('dd-MM-yyyy').format(piackedDate!);
                      _controller.experienceEndedDate.text =  DateFormat('dd-MM-yyyy').format(piackedDate);
                    },
                    date: _controller.experienceEndedDateObs.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Description",
                    textEditingController: _controller.experiencejobDescription,
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
                          _controller.updateExperience();
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
          margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Experience",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  _controller.user.experience != null 
                  ? IconButton(
                      onPressed: () {
                        _controller.getExperienceData();
                        _addData(context);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 25.r,
                        color: Colors.blue,
                      ))
                      : Container(),
                ],
              ),
              Divider(
                thickness: 1.5,
              ),
              // make a widget class for the listing
              (_controller.user.experience != null &&
                      !_controller.isLoadingExperience.value)
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount:
                          _controller.user.experience!.listOfJobs!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.work_outline,
                                      size: 25.r,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text(
                                        _controller
                                                .user
                                                .experience!
                                                .listOfJobs![index]
                                                .companyName ??
                                            "No Data",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    
                                        IconButton(
                                    onPressed: () {
                                      _controller.deleteExperience(index);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 25.r,
                                    ))
                                  ],
                                ),
                                    
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 32, bottom: 2.h),
                              child: Text(
                                _controller.user.experience!.listOfJobs![index]
                                        .jobRole ??
                                    "No Data",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 32, bottom: 2.h),
                              child: Text(
                                "${_controller.user.experience!.listOfJobs![index].startedDate ?? "No Data"} - ${_controller.user.experience!.listOfJobs![index].endedDate ?? "No Data"}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: Text(
                                _controller.user.experience!.listOfJobs![index].jobDescription ?? "No Data",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              thickness: 1.5,
                            ),
                          ],
                        );
                      },
                    )
                  : (_controller.user.experience == null &&
                          !_controller.isLoadingExperience.value)
                      ? Container(
                          // height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              _controller.getExperienceData();
                              _addData(context);
                            },
                            child: Text(
                              "Add Experience",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.work,
                            color: Colors.brown,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Total Work Experience",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            _controller.getEditTotalWorkExperience();
                            _addWorkExperience(context);
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.blue,
                            size: 25.r,
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 32,
                    ),
                    child: Text(
                      "${_controller.user.experience == null? 0: _controller.user.experience!.totalWorkExperience} Years",
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
