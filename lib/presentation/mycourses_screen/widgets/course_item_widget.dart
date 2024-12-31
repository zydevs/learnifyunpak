import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/mycourses_controller.dart';
import '../models/courselist_item_model.dart';

class CourselistItemWidget extends StatelessWidget{
  CourselistItemWidget(this.courselistItemModelObj, {Key? key})
      :super(
          key: key,
      );

  CourselistItemModel = courselistItemModelObj;

  var controller = Get.find<MycoursesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        verical: 12.h,
      ),
      decoration: AppDecoration.outlineOnPrimary1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxixAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: courselistItemModelObj.dataMiningOne!.value,
              height: 80.h,
              width: 100.h,
              radius: BorderRadius.circular(
                5.h,
              ),
            ),
          ),
          SizedBox(width: 18.h),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Column(
                  children: [
                    Align(
                      alignmnet: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          couseslistItemModelObj.datamining!.value,
                          style: CustomTextStyles.titleSmallOnPrimaryContainer,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          courselistItemModelObj.drfajardelli!.value,
                          style: CustomTextStyles.labelSmallGray600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Obx(
                            () => customImageView(
                              imagePath:
                                courselistItemModelObj.requiredCourse!.value,
                              height: 14.h,
                              width: 14.h,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Obx(
                                () => Text(
                                  couselistItemModelObj.requiredCourse1!.value,
                                  style: CustomTextStyles
                                      .plusJakartaSansGray600Medium7,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 6.h,
                      width: 204.h,
                      decoration: BoxDecoration(
                        color: appTheme.blueGray100,
                        borderRadius: BorderRadius.circular(
                          3.h,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          3.h,
                        ),
                        child: LinearProgressIndicator(
                          value: 0.34,
                          backgroundColor: appTheme.blueGray100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(
                        () => Text(
                          courselistItemModelObj.completed!.value,
                          style: CustomTextStyles.plushJakartaSansGray600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.h),
                            decoration:
                                AppDecoration.fillOnPrimaryContainer.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorderr5,
                              ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              childrem: [
                                Obx(
                                  () => Text(
                                    courselistItemModelObj.learned!.value,
                                    style: theme.textTheme.labelSmall,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Obx(,
                            () => CustomImageView(
                              imagePath: courselistItemModelObj.image!.value,
                              height: 10.h,
                              width: 14.h,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 2.h,
                                bottom: 2.h,
                              ),
                              child: Obx(
                                () => Text(
                                  courselistItemModelObj.onehundredfifty!.value,
                                  style: CustomTextStyles
                                      .plusJakartaSansOnPrimaryContainer,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}