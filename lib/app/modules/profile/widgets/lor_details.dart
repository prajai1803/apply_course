import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_text_field.dart';

class LORDeailsWidget extends StatelessWidget {
  LORDeailsWidget({super.key});

  final _controller = Get.find<ProfileController>();

  void _addData(context) {
    Get.defaultDialog(
      title: "Test Score Edit",
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
                    hintText: "Name",
                    textEditingController: _controller.lorContactName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Contact Number",
                    textEditingController: _controller.lorContactNumber,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                      hintText: "Email",
                      textEditingController: _controller.lorEmail),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                      hintText: "Job Post",
                      textEditingController: _controller.lorJobRole),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                      hintText: "Company Name",
                      textEditingController: _controller.lorCompanyName),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Recommonded by",
                    textEditingController: _controller.recommededBy,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Relationship with applicatnt",
                    textEditingController: _controller.lorRelationship,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Postal Address",
                    textEditingController: _controller.postalAddress,
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
                          _controller.updateLORDetails();
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Obx(
          () => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "LOR Details",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  _controller.user.lorDetails != null
                      ? IconButton(
                          onPressed: () {
                            _controller.getLORDetailsEdit();
                            _addData(context);
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 25.r,
                            color: Colors.blue,
                          ))
                      : Container()
                ],
              ),
              const Divider(
                thickness: 1.5,
              ),
              // make a widget class for the listing
              (_controller.user.lorDetails != null &&
                      !_controller.isLoadingLORDetails.value)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 250.w,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${_controller.user.lorDetails!.name} (${_controller.user.lorDetails!.jobRole} at ${_controller.user.lorDetails!.companyName})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Recommended By",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                  _controller.user.lorDetails!.recommededBy ??
                                      "",
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(_controller.user.lorDetails!.email ?? "",
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact Number",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                        _controller.user.lorDetails!
                                                .contactNumber ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ],
                                ),
                              ),
                              Container(
                                width: 160.w,
                                padding: EdgeInsets.only(left: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Relation To Student",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                        _controller.user.lorDetails!
                                                .relationToStudent ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Designation",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                        _controller.user.lorDetails!.jobRole ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ],
                                ),
                              ),
                              Container(
                                width: 160.w,
                                padding: EdgeInsets.only(left: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Orginazation Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                        _controller
                                                .user.lorDetails!.companyName ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Postal Address",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                  _controller.user.lorDetails!.postalAddress ??
                                      "",
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ],
                          ),
                        ),
                      ],
                    )
                  : (_controller.user.lorDetails == null &&
                          !_controller.isLoadingLORDetails.value)
                      ? Container(
                          // height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              _controller.getLORDetailsEdit();
                              _addData(context);
                            },
                            child: Text(
                              "Add Latter Of Recommedation",
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
            ],
          ),
        ),
      ),
    );
  }
}
