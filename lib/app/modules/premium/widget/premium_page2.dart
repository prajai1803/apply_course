import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumPage2 extends StatelessWidget {
  PremiumPage2({super.key});

  final _screenWidth = ScreenUtil().screenWidth;
  final _screenHeight = ScreenUtil().screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.award,
                size: 48.r,
                color: Colors.blue[800],
              ),
              SizedBox(
                  width: 162,
                  child: RichText(
                    text: TextSpan(
                        text: "What Makes ",
                        style: Theme.of(context).textTheme.titleLarge,
                        children: [
                          TextSpan(
                              text: "Premium ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.blue[900])),
                          TextSpan(
                              text: "The Best",
                              style: Theme.of(context).textTheme.titleLarge)
                        ]),
                    textAlign: TextAlign.center,
                  )),
              Icon(
                FontAwesomeIcons.award,
                size: 48.r,
                color: Colors.blue[800],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.w),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue[700]),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 12.h, right: 24.w, left: 24.w),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      height: 221.h,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17),
                            child: Center(
                                child: SizedBox(
                                    height: 100.h,
                                    child: Image.asset("assets/group.png"))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 14.w, right: 14.w, left: 14.w),
                            child: Text("Unbised Conselling",
                                style:
                                    Theme.of(context).textTheme.titleLarge),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Text(
                                "With 50+ experience counselors, we have a specialist for all YOUR preference and Priorities",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 12.h, right: 24.w, left: 24.w),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      height: 221.h,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17),
                            child: Center(
                                child: SizedBox(
                                    height: 100.h,
                                    child: Image.asset(
                                        "assets/Smarthouse.png"))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 14.w, right: 14.w, left: 14.w),
                            child: Text("Smartest Platform",
                                style:
                                    Theme.of(context).textTheme.titleLarge),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Text(
                                "A smart, Tech-savvy platform helps us serve all your need while you relax on your couch.",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 12.h, right: 24.w, left: 24.w, bottom: 14.h),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      height: 221.h,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17),
                            child: Center(
                                child: SizedBox(
                                    height: 100.h,
                                    child:
                                        Image.asset("assets/handShake.png"))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 14.w, right: 14.w, left: 14.w),
                            child: Text("Quality & Commitment",
                                style:
                                    Theme.of(context).textTheme.titleLarge),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Text(
                                "Keeping your interest as our first priority. it's our promise to assist you throughout your journey, always!",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
