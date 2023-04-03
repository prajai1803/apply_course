import 'package:apply_course/app/modules/authentication/login_page.dart';
import 'package:apply_course/app/modules/home/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBase extends StatelessWidget {
  const AppBase({super.key});

  @override
  Widget build(BuildContext context) {

    List screens = [
      HomeScreen(),
      // LoginScreen(),
    ];

    return Scaffold(
      body: screens[0],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
             
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          

      ],
      currentIndex: 0,
      ),
    );
  }
}