import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard2 extends StatelessWidget {
  const CourseCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8.w),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          // height: 250.h,
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 60 ,
                      width: 60,
                      child: Card(child: Image.asset("assets/google-logo.png")),
                    ),
                  ),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                        child: Text("Flutter Developer, Android Studio and Android Application Development",style: Theme.of(context).textTheme.titleSmall,),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2.h),
                        child: Text("Google",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.blue),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4,vertical: 0.h),
                        child: Row(
                          children: [
                            Card(
                              child: Container(
                                  height: 20,
                                  padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                // child: Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //   Padding(
                                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                                //     child: Icon(Icons.star,size: 10.r,color: Colors.white,),
                                //   ),
                                //   Padding(
                                //     padding: const EdgeInsets.symmetric(horizontal: 2),
                                //     child: Text("4.4",style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),),
                                //   )
                                // ],),
                                child: Text("On-Campus",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10),),
                              ),
                            ),
                      
                          ],
                        ),
                      ),

                    ],
                  ))
                ],
              ),
              Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          children: [
                            Icon(Icons.work_outline,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                              "4-Year Bachelor's Degree",
                              style: GoogleFonts.openSans(
                                  fontSize: 12,),
                                                      ),
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Icon(Icons.wallet_travel_outlined),
                      //     Text("6-9 LPA",style: GoogleFonts.openSans(
                      //           fontSize: 12, fontWeight: FontWeight.w600),)
                      //   ],
                      // )
                      
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 6),
                          child: Icon(Icons.location_on_outlined),
                        ),
                        Expanded
                        (child: Text("1600 Amphitheatre Parkway Mountain View, CA 94043, USA.",style: GoogleFonts.openSans(
                                fontSize: 12,),)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 6),
                          child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Column(

                          children: [
                            Text("Application fees",style: Theme.of(context).textTheme.bodySmall,),
                            Text(
                            "700000 USD",
                            style: GoogleFonts.openSans(
                                fontSize: 12),
                          ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text("Application fees",style: Theme.of(context).textTheme.bodySmall,),
                          Text("60000 USD",style: GoogleFonts.openSans(
                                fontSize: 12,),)
                        ],
                      )
                      
                    ],
                  ),
                        ),
                      
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}