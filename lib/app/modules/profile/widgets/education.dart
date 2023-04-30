import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:apply_course/app/modules/profile/widgets/profile_data_time.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'profile_drop_down.dart';
import 'profile_text_field.dart';

class EducationWidget extends StatelessWidget {
  EducationWidget({super.key});

  final _controller = Get.find<ProfileController>();


  void _addEducationYear(context) {
    Get.defaultDialog(
      title: "Test Score Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 170.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Total year of education",
                    isNumPad: true,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Total Backlog",
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

  void _addEducation(context) {
    Get.defaultDialog(
      title: "Test Score Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 250.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDropDown(
                    hintText: "Education Level",
                    data: ["10th", "12th", "Bachelor","Master"],
                    onChanged: (value) {
                      _controller.educationLevel.text = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Course Name",
                    textEditingController: _controller.courseName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "University Name",
                    textEditingController: _controller.university,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Percentage",
                    isNumPad: true,
                    textEditingController: _controller.achievedMarks,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDatePicker(
                    hintText: "Start Date",
                    // controller: _controller.experienceStartedDate,
                    onTap: () async {
                      DateTime? piackedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                          // _controller.experienceStartedDateObs.value = DateFormat('dd-MM-yy').format(piackedDate!);
                      // _controller.experienceStartedDate.text =  DateFormat('dd-MM-yy').format(piackedDate);
                      
                    },
                    // date: _controller.experienceStartedDateObs.value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDatePicker(
                    hintText: "Start Date",
                    // controller: _controller.experienceStartedDate,
                    onTap: () async {
                      DateTime? piackedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                          // _controller.experienceStartedDateObs.value = DateFormat('dd-MM-yy').format(piackedDate!);
                      // _controller.experienceStartedDate.text =  DateFormat('dd-MM-yy').format(piackedDate);
                      
                    },
                    // date: _controller.experienceStartedDateObs.value,
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
                  "Education",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                    onPressed: () {
                      _addEducation(context);
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
            (_controller.user.education != null &&
                      !_controller.isLoadingEducation.value)
                  ? ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
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
            );
              },

            ) : (_controller.user.education == null &&
                          !_controller.isLoadingEducation.value)
                      ? Container(
                          // height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              _controller.getEditEducation();
                              _addEducation(context);
                            },
                            child: Text(
                              "Add Education",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            
            const Divider(thickness: 1.5,),
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
                  IconButton(onPressed: (){
                    _addEducationYear(context);
                  }, icon: Icon(Icons.edit_outlined,color: Colors.blue,size: 28.r,)),
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