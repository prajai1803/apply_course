import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
    );
  }
}