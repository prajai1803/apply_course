import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

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
                  "Education",
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
                        Icon(FontAwesomeIcons.graduationCap,size: 20.r,),
                        Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text("Bachelor of Technology",style: Theme.of(context).textTheme.titleSmall,),
                    )
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined,color: Colors.blue,size: 25.r,))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32,bottom: 2.h),
                  child: Text("Computer Science & Engineering",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,color: Colors.black),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32,bottom: 2.h),
                  child: Text("Chhattisgarh swami vivekanand University",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32,bottom: 2.h),
                  child: Text("- 80%",style: Theme.of(context).textTheme.bodySmall,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Text("2019 - 2023",style: Theme.of(context).textTheme.bodySmall,),
                ),
              ],
            ),
            Divider(thickness: 1.5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ScreenUtil().screenWidth  *.35,
                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Icon(FontAwesomeIcons.graduationCap,size: 20.r,),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text('Total Year of Education',style: Theme.of(context).textTheme.titleSmall ,),
                              ),
                            ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 32,top: 8.h),
                            child: Text("14 Years",style: Theme.of(context).textTheme.bodySmall),
                          )
                        ],
                    
                      ),

                    ),
                    Container(
                      width: ScreenUtil().screenWidth  *.3,
                      padding: EdgeInsets.only(left: 8.w),
                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Icon(Icons.menu_book_outlined,color: Colors.red,size: 25.r,),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text('Total Backlogs',style: Theme.of(context).textTheme.titleSmall ,),
                                ),
                              ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 32,top: 8.h),
                              child: Text("0",style: Theme.of(context).textTheme.bodySmall,),
                            )
                          ],
                      
                        ),
                    ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined,color: Colors.blue,size: 28.r,)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}