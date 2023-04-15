import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyPrefrencesWidget extends StatelessWidget {
  const StudyPrefrencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Icon(Icons.book),
          Expanded(child: Column(
            children: [
              Text("Course Level"),
              Text("Master"),

            ],
          ))
        ],
      ),
    );
  }
}