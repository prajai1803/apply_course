import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestScoreWidget extends StatelessWidget {
  const TestScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Test Scores",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 25.r,
                      color: Colors.blue,
                    ))
              ],
            ),
            Divider(
              thickness: 1.5,
            ),
            // make a widget class for the listing
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 95.w,
                          padding: const EdgeInsets.only(right: 16),
                          child: Text('PTE',style: Theme.of(context).textTheme.titleSmall,),
                        ),
                    Text('70',style: Theme.of(context).textTheme.titleSmall,),
                      ],
                    ),
                    Row(
                      children: [
                        Text('05 Apr,2022',style: Theme.of(context).textTheme.titleSmall,),
                    IconButton(onPressed: (){},icon: Icon(Icons.edit_outlined,color: Colors.blue,),)
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 95.w,
                          padding: const EdgeInsets.only(right: 16),
                          child: Text('DUOLINGO',style: Theme.of(context).textTheme.titleSmall,),
                        ),
                    Text('70',style: Theme.of(context).textTheme.titleSmall,),
                      ],
                    ),
                    Row(
                      children: [
                        Text('05 Apr,2022',style: Theme.of(context).textTheme.titleSmall,),
                    IconButton(onPressed: (){},icon: Icon(Icons.edit_outlined,color: Colors.blue,),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}