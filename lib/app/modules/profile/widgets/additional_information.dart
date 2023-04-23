import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'profile_drop_down.dart';
import 'profile_text_field.dart';

class AdditionalInformationWidget extends StatelessWidget {
  const AdditionalInformationWidget({super.key});


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
                    hintText: "Contact Name",
                    isNumPad: true,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Contact Number",
                    isNumPad: true,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Email",
                    isNumPad: true,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Relationship with applicatnt",
                    isNumPad: true,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Mailing Address",
                    isNumPad: true,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Permanent Address",
                    isNumPad: true,
                    onChanged: (value) {},
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
                IconButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   // elevation: 100,
                      //   backgroundColor: Colors.white,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(30)),
                      //   isScrollControlled: true,
                      //   builder: (context) {
                      //     return EditAdditionalInformation();
                      //   },
                      // );
                      _addData(context);
                    },
                    icon: Icon(
                      Icons.add,
                      size: 25.r,
                      color: Colors.blue,
                    ))
              ],
            ),
            Divider(
              thickness: 1.5,
            ),
            // make a widget class for the listing
            Column(
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
                          Text("Prakhar Jaiswal",style: Theme.of(context).textTheme.titleSmall),
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
                          Text("+917999999999",style: Theme.of(context).textTheme.titleSmall),
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
                          Text("Prakharjaiswal02@gmail.com",style: Theme.of(context).textTheme.titleSmall),
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
                          Text("Sibling",style: Theme.of(context).textTheme.titleSmall),
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
                          Text("Kashimpara, Torwa Chaok, Bilaspur, Chhattishgar",style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                    Container(
                      width: 160.w,
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Parmanent Address",style: Theme.of(context).textTheme.bodyMedium,),
                          Text("Purani Basti, Dewangan Mohalla, Akaltara, Janjgir-Champa, Chhattishgarh, India",style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                  ],
                 ),
               ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}