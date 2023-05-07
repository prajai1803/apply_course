import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumPage1 extends StatelessWidget {
  PremiumPage1({super.key});

  final _screenWidth = ScreenUtil().screenWidth;
  final _screenHeight = ScreenUtil().screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
              height: _screenHeight - 80.h,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 366.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue[900]!,
                            const Color.fromARGB(113, 13, 72, 161),
                            const Color.fromARGB(0, 13, 72, 161)
                          ]),
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 200.h,
                          child: Image.asset("assets/table.png"))),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    child: RichText(
                      text: TextSpan(
                        text: "The Finest of Technology and ",
                        style: Theme.of(context).textTheme.titleLarge,
                        children: [
                          TextSpan(
                              text: "Counseling ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.blue[900])),
                          TextSpan(
                              text: "for Your Study Abroad ",
                              style: Theme.of(context).textTheme.titleLarge),
                          TextSpan(
                              text: "Dream",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.blue[900]))
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    child: SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[800],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            onPressed: () {},
                            child: Text(
                              "Book A Demo",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white),
                            ))),
                  ),
                ],
              ),
            );
  }
}