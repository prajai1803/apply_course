import 'package:apply_course/app/data/models/course_model.dart';
import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:apply_course/app/modules/home/widgets/apply_filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/card_button.dart';
import '../../widgets/course_card.dart';
import '../../widgets/course_card2.dart';
import '../../widgets/float_dropdown_button.dart';

class HomeScreen extends GetView {
  HomeScreen({super.key});

  // final _controller = Get.put(HomeController());
  // final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     // homeCtrl.getCourses();
      //     // _controller.getCourses();
      //   },
      //   child: Icon(Icons.analytics),
      // ),
      backgroundColor: const Color.fromARGB(255, 244, 245, 255),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Image.asset(
                      "assets/apply_course.png",
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 16.h),
                        child: const VerticalDivider(
                          thickness: 2,
                          width: 0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: SizedBox(
                height: 70.h,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 24, top: 0, right: 6),
                            child: const Icon(Icons.search),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45))),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context,
                      // elevation: 100,  
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      isScrollControlled:true,                  
                       builder: (context) {
                        return ApplyFilterWithBottomSheet();
                      },);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Row(
                            children: [
                              Icon(Icons.filter_alt_outlined,size: 18.r,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                child: Text("Filter",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13.sp),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return CardButton();
                      },
                    ),
                    // child: FutureBuilder(
                    //   future: _controller.getCourses(),

                    //   builder: (context, snapshot) {
                    //     return ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   shrinkWrap: true,
                    //   physics: ClampingScrollPhysics(),
                    //   itemCount: 1,
                    //   itemBuilder: (context, index) {
                    //     return Text();
                    //   },
                    // );
                    //   },
                    // child: Text(""),

                    // ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "25,447 Developer Jobs",
                  style: GoogleFonts.openSans(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // SizedBox(
            //   height: 400,
            //   child: ListView.builder(
            //     itemCount: 5,
            //     itemBuilder: (context, index) {
            //     CourseCard2();
            //   },),
            // )
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return CourseCard2();
              },),
            )
          ],
        ),
      ),
    );
  }
}
