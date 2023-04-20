import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTextField extends StatelessWidget {
  TextEditingController? textEditingController;
  String? hintText;
  ProfileTextField({super.key,required this.textEditingController,this.hintText = ""});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        style: Theme.of(context).textTheme.bodySmall,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // hintText: hintText
          labelText: hintText,
          ),
      ),
    );
  }
}