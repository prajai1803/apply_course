import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDropDown extends StatelessWidget {
  String? hintText;
  List data = [];
  Function(dynamic value)? onChanged;
  ProfileDropDown({super.key, required this.data, this.hintText = "",required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: DropdownButtonFormField(
            style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                filled: true,
                labelStyle: Theme.of(context).textTheme.bodySmall,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                helperStyle: Theme.of(context).textTheme.bodySmall,
                enabledBorder: OutlineInputBorder(
                  gapPadding: 4,
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: hintText,
              ),
              
              items: data.map<DropdownMenuItem<String>>((e) => DropdownMenuItem<String>(value: e,child: Text(e,style: Theme.of(context).textTheme.bodySmall,))).toList(),
              onChanged: onChanged,
              
              ),
        ),
      ),
    );
  }
}
