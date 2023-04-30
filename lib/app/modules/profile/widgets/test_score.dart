import 'package:apply_course/app/modules/profile/profile_controller.dart';
import 'package:apply_course/app/modules/profile/widgets/profile_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../core/values/apply_filter_dropdown_models.dart';
import 'profile_data_time.dart';
import 'profile_drop_down.dart';

class TestScoreWidget extends StatelessWidget {
  TestScoreWidget({super.key});

  final _controller = Get.find<ProfileController>();

  void _addData(context) {
    Get.defaultDialog(
      title: "Test Score Edit",
      titleStyle: Theme.of(context).textTheme.titleLarge,
      content: SingleChildScrollView(
        child: SizedBox(
          height: 250.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDropDown(
                    hintText: "Test",
                    data: ["GMAT", "GRE", "PTE"],
                    onChanged: (value) {
                      _controller.testType.text = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileTextField(
                    hintText: "Score",
                    isNumPad: true,
                    textEditingController: _controller.score,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileDatePicker(
                    hintText: "Exam Date",
                    controller: _controller.examDate,
                    onTap: () async {
                      DateTime? piackedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));
                          _controller.examDateObs.value = DateFormat('dd-MM-yyyy').format(piackedDate!);
                      _controller.examDate.text =  DateFormat('dd-MM-yyyy').format(piackedDate);
                    },
                    date: _controller.examDateObs.value,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: Theme.of(context).textTheme.titleSmall,
                        )),
                    ElevatedButton(
                        onPressed: () {
                          _controller.addTestScore();
                        },
                        child: Text(
                          "Save",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Obx(
        ()=> Container(
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
                  _controller.user.testScore != null
                   ? IconButton(
                      onPressed: () {
                        _controller.getEditTestScore();
                        _addData(context);
                      },
                      icon: Icon(
                        Icons.add,
                        size: 25.r,
                        color: Colors.blue,
                      ))
                      : Container(),
                ],
              ),
              Divider(
                thickness: 1.5,
              ),
              // make a widget class for the listing
              (_controller.user.testScore != null &&
                        !_controller.isLoadingTestScore.value)
                    ? ListView.builder(
                itemCount: _controller.user.testScore!.listOfTest!.length,
                shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 95.w,
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              _controller.user.testScore!.listOfTest![index].testName ?? "",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Text(
                            _controller.user.testScore!.listOfTest![index].testScore ?? "",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _controller.user.testScore!.listOfTest![index].date ?? "",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          IconButton(
                            onPressed: () {
                              _controller.deleteTestScore(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
              },) : (_controller.user.testScore == null &&
                            !_controller.isLoadingTestScore.value)
                        ? Container(
                            // height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              onPressed: () {
                                _controller.getEditTestScore();
                                _addData(context);
                              },
                              child: Text(
                                "Add Test Score",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.red),
                              ),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
              
            ],
          ),
        ),
      ),
    );
  }
}
