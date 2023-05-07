import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumPage3 extends StatelessWidget {
  const PremiumPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 36.h),
          child: Text(
            "OUR WINNING RECORD",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.blue[900]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
          child: Text("Because you deserve only The Best!",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 22.sp),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 12.h, left: 24.w, right: 24.w),
          child: Text(
            "Some advices can come from come only from experience and we have lot of that! see for yourselves...",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Container(
          height: 400.h,
          padding: EdgeInsets.all(24.w),
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.blue[900]!,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      width: 2,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.blue[900]!),
                              borderRadius: BorderRadius.circular(360)),
                          padding: EdgeInsets.all(4.r),
                          child: Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 16.r,
                            color: Colors.blue[900],
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, left: 14.w, right: 24.w),
                      child: Text(
                        "\$15 Million+",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20.sp,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, left: 14.w, right: 14.w),
                      child: Text(
                        "Schoolarship Achieved",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.blue[900]!,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      width: 2,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.blue[900]!),
                              borderRadius: BorderRadius.circular(360)),
                          padding: EdgeInsets.all(4.r),
                          child: Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 16.r,
                            color: Colors.blue[900],
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, left: 14.w, right: 24.w),
                      child: Text(
                        "22+ Country",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20.sp,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, left: 14.w, right: 14.w),
                      child: Text(
                        "You can reach with us",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.blue[900]!,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      width: 2,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.blue[900]!),
                              borderRadius: BorderRadius.circular(360)),
                          padding: EdgeInsets.all(4.r),
                          child: Icon(
                            FontAwesomeIcons.dollarSign,
                            size: 16.r,
                            color: Colors.blue[900],
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, left: 14.w, right: 24.w),
                      child: Text(
                        "3500+ Cr",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 20.sp,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, left: 14.w, right: 14.w),
                      child: Text(
                        "Lone Senctioned",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.blue[900]!,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      width: 2,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.blue[900]!),
                              borderRadius: BorderRadius.circular(360)),
                          padding: EdgeInsets.all(4.r),
                          child: Icon(
                            Icons.flight,
                            size: 16.r,
                            color: Colors.blue[900],
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, left: 14.w, right: 24.w),
                      child: Text(
                        "98%",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 22.sp,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 14.w, right: 14.w),
                      child: Text(
                        "School visa \nSuccess rate",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}
