import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyFilterWithBottomSheet extends StatelessWidget {
  ApplyFilterWithBottomSheet({super.key});

  final _controller = Get.put(HomeController());

  var _height = ScreenUtil().screenHeight;
  var _width = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: double.infinity,
      // child: Text("$_width X $_height"),
      child: SizedBox(
        height: 500,
        child: Column(
          children: [
            // titile
            Container(
              height: 76.h,
              padding: EdgeInsets.only(left: 28, top: 18.h, right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Text(
                    "Filter Apply Jobs",
                    style: GoogleFonts.openSans(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              child: Row(
                children: [
                  SizedBox(
                      height: 400.h,
                      width: 100,
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _controller.currentTabIndex.value = index;
                            },
                            child: Obx(
                              () => Row(
                                children: [
                                  AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      color:
                                          _controller.currentTabIndex.value ==
                                                  index
                                              ? Colors.blue
                                              : null,
                                      width: 5,
                                      height: 50),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12.h),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.h),
                                      child: Text("Tab $index"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5.h,
                          );
                        },
                      )),
                  Expanded(
                    child: SizedBox(
                        height: 400,
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 70.h,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 24, top: 0, right: 6),
                                          child: const Icon(Icons.search),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 340.h,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return 
                                     Obx(
                                       ()=> RadioMenuButton(
                                          value: "development $index",
                                          groupValue: _controller.department.value,
                                     
                                          onChanged: (value) {
                                            printInfo(info: value!);
                                            _controller.department.value = value;
                                          },
                                          child: Text("Development $index"),
                                                                       ),
                                     );
                                },
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
