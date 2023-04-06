import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:apply_course/app/modules/home/widgets/apply_filter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/card_button.dart';
import '../../widgets/course_card.dart';

class HomeScreen extends GetView {
  HomeScreen({super.key});

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text("Apply Course",style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.w600),)
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
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: SizedBox(
                height: 60.h,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 24, right: 6),
                            child: Icon(Icons.search,size: 25.r,),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(45))),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 35.h,
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(context: context,
                      // elevation: 100,  
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
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
                              Icon(Icons.filter_alt_outlined,size: 14.r,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                child: Text("Filter",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12.sp),),
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
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                ()=> Container(
                  height: 30.h,
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                  child: Text(
                    "${_controller.coursesList.length} Courses found",
                    style: GoogleFonts.openSans(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Obx(
              ()=> Container(
                child: 
               _controller.coursesList.isNotEmpty ? Expanded(
                      child: 
                        ListView.builder(
                          itemCount: _controller.coursesList.length,
                          itemBuilder: (context, index) {
                            print(_controller.coursesList.length);
                          var data = _controller.coursesList[index];
                          print(data.universityLogo);
                           return CourseCard(
                            universityName: data.university,
                            applicationFee: data.applicationFee,
                            mode: data.programMethod![0],
                            courseName: data.courseName,
                            duration: data.programLength,
                            location: data.location,
                            courseLogo: data.universityLogo,
                            tutionFee: data.tutionFee,
                          );
                        },),
                      
                    ) : const Center(
                    child: CircularProgressIndicator(),
                  ),
              ),
            ) 
          ],
        ),
      ),
    );
  }
}
