import 'package:apply_course/app/core/values/keys.dart';
import 'package:apply_course/app/data/models/course_model.dart';
import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:apply_course/app/modules/home/widgets/apply_filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore _f = FirebaseFirestore.instance;
          CollectionReference c = _f.collection(KeysConstant.Courses);
          await c.doc().set(CourseModel(
                  courseName: "BCA",
                  costOfLiving: 300,
                  university: "Bilaspur University",
                  category: "BCA",
                  courseId: 4579,
                  location: "Bilaspur, Chhattishgarh",
                  minEducationLevel: "",
                  programLevel: ["Bachelor's Degree"],
                  programLength: "3-years",
                  subCategory: "None",
                  programMethod: ["Online"],
                  programSummary: "Lorem Isme",
                  startDate: "20-03-2023",
                  universityLogo:
                      "https://upload.wikimedia.org/wikipedia/en/4/46/Atal_Bihari_Vajpayee_Vishwavidyalaya.jpg?20181012220030",
                  universityDetails: "Lorem ipsam",
                  admissionRequirement: AdmissionRequirement(
                      academicsBackgroud: AcademicsBackgroud(
                          minimumEducation: "12th",
                          minimumGpa: "6",
                          minimumLts: ["TCSl"])),
                  applicationFee: 20,
                  tutionFee: 5000)
              .toJson());
        },
        child: Icon(Icons.abc),
      ),
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
                          _controller.getCourses();
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
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0.72.h),
                          fillColor: Colors.white,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 24, right: 6),
                            child: Icon(
                              Icons.search,
                              size: 25.r,
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
                () => Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
                child: _controller.coursesList.isNotEmpty
                    ? Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            return _controller.reFreshCourse();
                          },
                          child: ListView.builder(
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
                                programLevel: data.programLevel![0],
                              );
                            },
                          ),
                        ),
                      )
                    : const Center(
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
