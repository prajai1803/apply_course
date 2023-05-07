import 'package:apply_course/app/modules/home/home_page_view.dart';
import 'package:apply_course/app/modules/premium/premium_view.dart';
import 'package:apply_course/app/modules/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'appbase_controller.dart';

class AppBase extends StatelessWidget {
  AppBase({super.key});

  final _controller = Get.put(AppBaseController());

  @override
  Widget build(BuildContext context) {

    List screens = [
      HomeScreen(),
      HomeScreen(),
      PremiumConsellingScreen(),
      HomeScreen(),
      ProfileScreen(),
      // LoginScreen(),
    ];

    return Obx(
     ()=> Scaffold(
        body: screens[_controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          
          items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.crown,color: Colors.blue[800],),
              label: 'Preminum',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              label: 'My Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: 'Profile',
            ),
            
    
        ],
        currentIndex: _controller.currentIndex.value,
        onTap: (value) {
          _controller.currentIndex.value = value;
        },
        ),
      ),
    );
  }
}