import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTextField extends StatelessWidget {
  TextEditingController? textEditingController;
  String? hintText;
  bool isNumPad = false;
  Function(dynamic value)? onChanged;
  Function()? onTap;
  String? Function(String?)? validator;
  ProfileTextField({super.key,this.textEditingController,this.hintText = "",this.isNumPad = false,this.onChanged,this.onTap,this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: isNumPad ? TextInputType.phone : TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        style: Theme.of(context).textTheme.bodySmall,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          labelStyle: Theme.of(context).textTheme.bodySmall,
            hintStyle: Theme.of(context).textTheme.bodySmall,
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