import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LORDeailsWidget extends StatelessWidget {
  const LORDeailsWidget({super.key});

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
                  "LOR Details",
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
               Row(
                 children: [
                   Container(
                    width: 250.w,
                    child: Column(
                      children: [
                        Text('Prakhar Jaiswal (Flutter Developer at Better Jobs)',style: Theme.of(context).textTheme.titleLarge,),
                      ],
                    )),
                    Expanded(child: IconButton(onPressed: (){},icon: Icon(Icons.edit_outlined,color: Colors.blue,size: 25.r,),))
                 ],
               ),
               Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recommended By",style: Theme.of(context).textTheme.bodyMedium,),
                          Text("Prakhar Jaiswal",style: Theme.of(context).textTheme.titleSmall),
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
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact Number",style: Theme.of(context).textTheme.bodyMedium,),
                          Text("+917999999999",style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                    Container(
                      width: 160.w,
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Relation To Student",style: Theme.of(context).textTheme.bodyMedium,),
                          Text("Friend",style: Theme.of(context).textTheme.titleSmall),
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
                          Text("Designation",style: Theme.of(context).textTheme.bodyMedium,),
                          Text("Flutter Developer",style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                    Container(
                      width: 160.w,
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Orginazation Name",style: Theme.of(context).textTheme.bodyMedium,),
                          Text("Better Jobs",style: Theme.of(context).textTheme.titleSmall),
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
                          Text("Postal Address",style: Theme.of(context).textTheme.bodyMedium,),
                          Text("Bilaspur,Chhattishgarh, India",style: Theme.of(context).textTheme.titleSmall),
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