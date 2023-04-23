import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'profile_data_time.dart';
import 'profile_text_field.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});


  void _addWorkExperience(context) {
    Get.defaultDialog(
      title: "Test Score Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 105.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Total Work Experience",
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

  void _addData(context) {
    Get.defaultDialog(
      title: "Test Score Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 250.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ProfileDropDown(
                //     hintText: "Test",
                //     data: ["GMAT", "GRE", "PTE"],
                //     onChanged: (value) {},
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Jobs Post",
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Company Name",
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDatePicker(
                    hintText: "Start Date",
                    onTap: () async {
                      DateTime? piackedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                      // _controller.dobTextController.value =  DateFormat('dd-mm-yy').format(piackedDate!);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDatePicker(
                    hintText: "End Date",
                    onTap: () async {
                      DateTime? piackedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                      // _controller.dobTextController.value =  DateFormat('dd-mm-yy').format(piackedDate!);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Description",
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
                  "Experience",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                    onPressed: () {
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
                    IconButton(onPressed: (){
                      _addWorkExperience(context);
                    }, icon: Icon(Icons.edit_outlined,color: Colors.blue,size: 25.r,))
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