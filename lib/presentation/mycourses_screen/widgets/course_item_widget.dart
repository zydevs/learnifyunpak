import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/mycourses_controller.dart';
import '../models/courselist_item_model.dart';

// ignore_for_file: must_be_immutable
class CourselistItemWidget extends StatelessWidget{
  CourselistItemWidget(this.courselistItemModelObj, {Key? key})
      :super(
          key: key,
      );

  CourselistItemModel courselistItemModelObj;
  
  var controller = Get.find<MycoursesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 12.h,
      ),
      decoration: AppDecoration.outlineOnprimary1.copyWith(
        borderRadius: BorderRadiusStyle.rounderBorder5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: courselistItemModelObj.covercourse!.value,
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
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          courselistItemModelObj.namecourse!.value,
                          style: CustomTextStyles.titleSmallOnPrimaryContainer,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(
                        () => Text(
                          courselistItemModelObj.lecture!.value,
                          style: CustomTextStyles.labelSmallGray600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Obx(
                            () => CustomImageView(
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
                                  courselistItemModelObj.requiredCourse1!.value,
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
                          style: CustomTextStyles.plusJakartaSansGray600,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.h),
                            decoration:
                                AppDecoration.fillOnPrimaryContainer.copyWith(
                              borderRadius: BorderRadiusStyle.rounderBorder5,
                              ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                          Obx(
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