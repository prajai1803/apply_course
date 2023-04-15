import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

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
                  "Experience",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.work_outline,size: 25.r,),
                        Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Better Jobs",style: Theme.of(context).textTheme.titleSmall,),
                    )
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined,color: Colors.blue,size: 25.r,))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32,bottom: 2.h),
                  child: Text("Flutter Developer",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,color: Colors.black),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32,bottom: 2.h),
                  child: Text("01 March, 2023 - 12 Apr,2023",style: Theme.of(context).textTheme.bodySmall,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Text("Description",style: Theme.of(context).textTheme.bodySmall,),
                ),
              ],
            ),
            Divider(thickness: 1.5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.work,color: Colors.brown,),
                        Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Total Work Experience",style: Theme.of(context).textTheme.titleSmall,),
                    )
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined,color: Colors.blue,size: 25.r,))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32,),  
                  child: Text("1 Years",style: Theme.of(context).textTheme.bodySmall!,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}