
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardButton extends StatelessWidget {
  const CardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      child: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: Row(
            children: [Text("Development",style: GoogleFonts.openSans(fontWeight: FontWeight.w400,fontSize: 12.sp),), Icon(Icons.arrow_drop_down,size: 18.sp,)],
          ),
        ),
      ),
    );
  }
}