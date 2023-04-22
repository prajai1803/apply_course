import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProfileDatePicker extends StatelessWidget {
  String date = '';
  String? hintText;
  Function()? onTap;
  ProfileDatePicker({super.key,this.date = "",this.onTap,this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.bodySmall,
        
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: hintText,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          hintText: date == ""? "Pick Date" : date,
        ),
      ),
    );
  }
}
