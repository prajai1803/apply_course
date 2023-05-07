import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/premium_page1.dart';
import 'widget/premium_page2.dart';
import 'widget/premium_page3.dart';

class PremiumConsellingScreen extends StatelessWidget {
  PremiumConsellingScreen({super.key});

  final _screenWidth = ScreenUtil().screenWidth;
  final _screenHeight = ScreenUtil().screenHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            PremiumPage1(),
            PremiumPage2(),
            PremiumPage3()
          ]),
        ),
      ),
    );
  }
}
