import 'package:apply_course/app/core/values/keys.dart';
import 'package:apply_course/app/data/models/course_model.dart';
import 'package:apply_course/app/data/providers/firebase_provider.dart';
import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:apply_course/app/modules/home/widgets/apply_filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/card_button.dart';
import '../../widgets/course_card.dart';
import 'widgets/drawer.dart';

class HomeScreen extends GetView {
  HomeScreen({super.key});

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldKey,
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   // _controller.filterSearch("BCA");
      //   FirebaseProvider().test();
      // },child: Icon(Icons.abc)),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     FirebaseFirestore _f = FirebaseFirestore.instance;
      //     CollectionReference c = _f.collection(KeysConstant.Courses);
      //     await c.doc().set(CourseModel(
      //             courseName: "Master of Arts",
      //             costOfLiving: 300,
      //             university: "Bilaspur University",
      //             category: "Master of Arts",
      //             courseId: 49,
      //             location: "Bilaspur, Chhattishgarh",
      //             minEducationLevel: "",
      //             programLevel: "Master's Degree",
      //             programLength: "2-years",
      //             subCategory: "Hindi",
      //             programMethod: "Online",
      //             programSummary: "Lorem Isme",
      //             startDate: "20-03-2023",
      //             universityLogo:
      //                 "https://upload.wikimedia.org/wikipedia/en/4/46/Atal_Bihari_Vajpayee_Vishwavidyalaya.jpg?20181012220030",
      //             universityDetails: "Lorem ipsam",
      //             admissionRequirement: AdmissionRequirement(
      //                 academicsBackgroud: AcademicsBackgroud(
      //                     minimumEducation: "12th",
      //                     minimumGpa: "6",
      //                     minimumLts: ["TCSl"])),
      //             applicationFee: 200,
      //             tutionFee: 6000)
      //         .toJson());
      //   },
      //   child: Icon(Icons.abc),
      // ),

      endDrawer: AppDrawer(),
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
                      child: Text(
                        "Apply Course",
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
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
                      InkWell(
                        onTap: () {
                          // _controller.getCourses();
                          _controller.openDrawer();
                          print("object");
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0.r),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: SizedBox(
                height: 62,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        _controller.filterSearch(value);
                      },
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0.72.h),
                          fillColor: Colors.white,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 24, right: 6),
                            child: Icon(
                              Icons.search,
                              size: 25,
                            ),
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
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        // elevation: 100,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        isScrollControlled: true,
                        builder: (context) {
                          return ApplyFilterWithBottomSheet();
                        },
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45)),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Row(
                            children: [
                              Icon(
                                Icons.filter_alt_outlined,
                                size: 14.r,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                child: Text(
                                  "Filter",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 12.sp),
                                ),
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
                      itemCount: _controller.listOfFilter.length,
                      itemBuilder: (context, index) {
                        var name = _controller.listOfFilter[index];
                        return InkWell(
                            onTap: () {
                              _controller.currentTabIndex.value = index;
                              _controller.changeCategory();
                              showModalBottomSheet(
                                context: context,
                                // elevation: 100,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                isScrollControlled: true,
                                builder: (context) {
                                  return ApplyFilterWithBottomSheet();
                                },
                              );
                            },
                            child: CardButton(
                              name: name,
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Container(
                  height: 40.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: Text(
                    "${_controller.coursesList.length} Courses found",
                    style: GoogleFonts.openSans(
                        fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                child: _controller.isFilterLoading.value ?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator()
                      ],
                    )
                    : _controller.coursesList.isEmpty ?
                    Center(child: Text("No Data Found!",style: Theme.of(context).textTheme.bodySmall,),):
                    Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            return _controller.reFreshCourse();
                          },
                          child: ListView.builder(
                            itemCount: _controller.coursesList.length,
                            itemBuilder: (context, index) {
                              var data = _controller.coursesList[index];
                              return CourseCard(
                                universityName: data.university,
                                applicationFee: data.applicationFee,
                                mode: data.programMethod,
                                courseName: data.courseName,
                                duration: data.programLength,
                                location: data.location,
                                courseLogo: data.universityLogo,
                                tutionFee: data.tutionFee,
                                programLevel: data.programLevel,
                              );
                            },
                          ),
                        ),
                      )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
