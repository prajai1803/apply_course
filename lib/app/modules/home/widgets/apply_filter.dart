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
          color: Colors.white, borderRadius: BorderRadius.circular(30)),

      // child: Text("$_width X $_height"),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // titile
            Container(
              height: 76.h,
              padding: EdgeInsets.only(left: 28, top: 18.h, right: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
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
            const Divider(thickness: 1.5,),
            Container(
              child: Row(
                children: [
                  SizedBox(
                      height: 340.h,
                      width: 100,
                      child: ListView.separated(
                        itemCount: _controller.listOfFilter.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _controller.currentTabIndex.value = index;
                              _controller.changeCategory();
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
                                      child: Text(
                                        _controller.listOfFilter[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
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
                      Container(
                        height: 350.h,
                        width: 2,
                        child: VerticalDivider(thickness: 1.5,)),
                  Expanded(
                    child: SizedBox(
                        height: 350.h,
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 70,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextField(
                                    style: Theme.of(context).textTheme.bodySmall,
                                    onChanged: (value) {
                                      _controller.filterSearchController.value = value;
                                      _controller.inFilterSearch(_controller.filterSearchController.value);
                                    },
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
                              () => Container(
                                height: 400.h,
                                child: _controller.filterdList.value.length != 0 ?ListView.builder(
                                  itemCount: _controller.filterdList.value.length,
                                  itemBuilder: (context, index) {
                                    // return Text('$index');
                                    return Obx(
                                     ()=> RadioMenuButton(
                                        value: _controller.filterdList[index],
                                        groupValue: _controller
                                            .getListName(
                                                _controller.currentTabIndex.value)
                                            .value,
                                        onChanged: (value) {
                                          printInfo(info: value!.toString());
                                          _controller
                                              .getListName(_controller
                                                  .currentTabIndex.value)
                                              .value = value;
                                        },
                                        child: Text(
                                          _controller.filterdList[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    );
                                  },
                                ) : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [Text("Sorry! No Result Found.",style: Theme.of(context).textTheme.bodySmall,)],
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            const Divider(thickness: 1.5,),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: () {
                      Get.back();
                    }, child: Text("Cancel",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.blue[800] ),)),
                    ElevatedButton(onPressed: (){
                      Get.back();
                    }, child: Text("Apply Filter",style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
