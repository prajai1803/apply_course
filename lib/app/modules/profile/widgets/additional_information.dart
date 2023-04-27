import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'profile_drop_down.dart';
import 'profile_text_field.dart';

class AdditionalInformationWidget extends StatelessWidget {
  AdditionalInformationWidget({super.key});

  final _controller = Get.find<ProfileController>();

  void _addData(context) {
    Get.defaultDialog(
      title: "Additional Informartion Edit",
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
                    hintText: "Contact Name",
                    onChanged: (value) {},
                    textEditingController: _controller.additionalCantactName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Contact Number",
                    textEditingController: _controller.additionalCantactNumber,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Email",
                    textEditingController: _controller.additionalEmail,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Relationship with applicatnt",
                    textEditingController: _controller.additionalRelastionship,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Mailing Address",
                    textEditingController: _controller.additionalMailingAddress,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Permanent Address",
                    textEditingController: _controller.additionalPermanentAddress,
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
                          _controller.updateAdditionalInformation();
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
                    "Additional Information",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                 _controller.user.additionalInformation != null ? IconButton(
                      onPressed: () {
                        _controller.getAdditionalInformationEdit();
                        _addData(context);
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 25.r,
                        color: Colors.blue,
                      )): Container(),
                ],
              ),
              const Divider(
                thickness: 1.5,
              ),
              // make a widget class for the listing
              (_controller.user.additionalInformation != null && !_controller.isLoadingAdditionalInformation.value) ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text('Emergency Contact',style: Theme.of(context).textTheme.titleLarge,),
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
                            Text("Contact Name",style: Theme.of(context).textTheme.bodyMedium,),
                            Text(_controller.user.additionalInformation!.contactName ?? "No Data",style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                      Container(
                        width: 160.w,
                        padding: EdgeInsets.only(left: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact Number",style: Theme.of(context).textTheme.bodyMedium,),
                            Text(_controller.user.additionalInformation!.contactNumber ?? "No Data",style: Theme.of(context).textTheme.titleSmall),
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
                            Text("Email",style: Theme.of(context).textTheme.bodyMedium,),
                            Text(_controller.user.additionalInformation!.email ?? "No Data",style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                  Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Relationship with Applicant",style: Theme.of(context).textTheme.bodyMedium,),
                            Text(_controller.user.additionalInformation!.relationshipWithApplicant ?? "No Data",style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                 Padding(
                   padding: EdgeInsets.only(top: 8.h),
                   child: Text('Address',style: Theme.of(context).textTheme.titleLarge,),
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
                            Text("Mailing Address",style: Theme.of(context).textTheme.bodyMedium,),
                            Text(_controller.user.additionalInformation!.mailingAdress ?? "No Data",style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                      Container(
                        width: 160.w,
                        padding: EdgeInsets.only(left: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Permanent Address",style: Theme.of(context).textTheme.bodyMedium,),
                            Text(_controller.user.additionalInformation!.permanentAddress ?? "No Data",style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                    ],
                   ),
                 ),
                  
                ],
              ) : (_controller.user.additionalInformation == null && !_controller.isLoadingAdditionalInformation.value) ? Container(
                        // height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {
                            _controller.getAdditionalInformationEdit();
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