import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdditionalInformationWidget extends StatelessWidget {
  const AdditionalInformationWidget({super.key});

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
                    onPressed: () {},
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