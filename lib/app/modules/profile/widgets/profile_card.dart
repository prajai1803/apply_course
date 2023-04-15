import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // height: 330.h,
        width: double.infinity,
        padding: EdgeInsets.all(14.r),
        child: Column(
          children: [
            // part 1
            Column(
              children: [
                Container(
                  height: 117.w,
                  width: 117.w,
                  // child: Image.asset("assets/get_started.png")
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Container(
                    height: 27.h,
                    color: Colors.grey[100],
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add Picture",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.green),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // part 2
            Column(
              children: [
                // name and edit button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Prakhar Jaiswal",
                        style: Theme.of(context).textTheme.titleLarge),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 25.r,
                          color: Colors.blue,
                        ))
                  ],
                ),
                // Profile status and percentage
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Status",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "33%",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 33,
                    size: 5,
                    padding: 0,
                    selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue[900]!.withOpacity(.5),Colors.blue[900]!],
                              ),
                              unselectedColor: Colors.blue.withOpacity(.2),
                  ),
                ),
                // Email and Phone Number
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 14.r,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 10.w),
                            child: Text(
                              "Prajai1801@gmail.com",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.phone_android_outlined,
                            size: 14.r,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text("+917987590643",
                                style: Theme.of(context).textTheme.bodySmall),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14.r,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 10.w),
                            child: Text(
                              "India",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            size: 14.r,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text("18-03-2001",
                                style: Theme.of(context).textTheme.bodySmall),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.male,
                            size: 14.r,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 10.w),
                            child: Text(
                              "Male",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.group,
                            size: 14.r,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text("Unmarried",
                                style: Theme.of(context).textTheme.bodySmall),
                          )
                        ],
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
