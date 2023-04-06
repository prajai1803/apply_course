import 'package:apply_course/app/modules/home/home_conrtroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/values/apply_filter_dropdown_models.dart';

class ApplyFilterWithBottomSheet extends StatelessWidget {
  ApplyFilterWithBottomSheet({super.key});

  final _controller = Get.put(HomeController());

  final _height = ScreenUtil().screenHeight;
  final _width = ScreenUtil().screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: double.infinity,
      decoration: BoxDecoration(
                  color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      
      // child: Text("$_width X $_height"),
      child: Container(
        decoration: const BoxDecoration(
          
          color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
        height: 500,
        child: Column(
          children: [
            // titile
            Container(
              height: 76.h,
              padding: EdgeInsets.only(left: 28, top: 18.h, right: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                children: [
                  Text(
                    "Filter Apply Courses",
                    style: GoogleFonts.openSans(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
           const Divider(),
            Container(
              child: Row(
                children: [
                  SizedBox(
                      height: 400.h,
                      width: 100,
                      child: ListView.separated(
                        itemCount: _controller.listOfFilter.length,
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
                                      child: Text(_controller.listOfFilter[index]),
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
                            Obx(
                              ()=> SizedBox(
                                height: 340.h,
                                child: ListView.builder(
                                  itemCount: ApplyFilterDropDownModels.list[_controller.currentTabIndex.value].length,
                                  itemBuilder: (context, index) {
                                    var data = ApplyFilterDropDownModels.list[_controller.currentTabIndex.value];
                                    return 
                                       Obx(
                                         ()=> RadioMenuButton(
                                            value: data[index],
                                            groupValue: _controller.getListName(_controller.currentTabIndex.value).value,
                                       
                                            onChanged: (value) {
                                              printInfo(info: value!.toString());
                                              _controller.getListName(_controller.currentTabIndex.value).value = value;
                                            },
                                            
                                            child: Text(data[index]),
                                                                         ),
                                       );
                                  },
                                ),
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
