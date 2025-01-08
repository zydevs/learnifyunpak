import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/mycourses_controller.dart';
import '../models/courselist_item_model.dart';

// ignore_for_file: must_be_immutable
class CourselistItemWidget extends StatelessWidget {
  CourselistItemWidget(this.courselistItemModelObj, {Key? key})
      : super(key: key);

  final CourselistItemModel courselistItemModelObj;
  final controller = Get.find<MycoursesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 12.h),
      decoration: AppDecoration.outlineOnprimary1.copyWith(
        borderRadius: BorderRadiusStyle.rounderBorder5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Cover Image
          Obx(
            () => CustomImageView(
              imagePath: courselistItemModelObj.covercourse?.value ?? '',
              height: 80.h,
              width: 100.h,
              radius: BorderRadius.circular(5.h),
              // placeholder: ImageConstant.imgPlaceholder, // Tambahkan placeholder
            ),
          ),
          SizedBox(width: 18.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Name
                  Obx(
                    () => Text(
                      courselistItemModelObj.namecourse?.value ?? 'Unknown Course',
                      style: CustomTextStyles.titleSmallOnPrimaryContainer,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  // Lecturer Name
                  Obx(
                    () => Text(
                      courselistItemModelObj.lecture?.value ?? 'Unknown Lecturer',
                      style: CustomTextStyles.labelSmallGray600,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  // Required Course Icon and Text
                  Row(
                    children: [
                      Obx(
                        () => CustomImageView(
                          imagePath: courselistItemModelObj.requiredCourse?.value ?? '',
                          height: 14.h,
                          width: 14.h,
                        ),
                      ),
                      SizedBox(width: 4.h),
                      Obx(
                        () => Text(
                          courselistItemModelObj.requiredCourse1?.value ?? '',
                          style: CustomTextStyles.plusJakartaSansGray600Medium7,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Progress Indicator
                  Container(
                    height: 6.h,
                    width: 204.h,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray100,
                      borderRadius: BorderRadius.circular(3.h),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3.h),
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
                  // Completed Percentage
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => Text(
                        courselistItemModelObj.completed?.value ?? '0% Completed',
                        style: CustomTextStyles.plusJakartaSansGray600,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Footer Row (Learned Button and Count)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Learned Button
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.h),
                        decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.rounderBorder5,
                        ),
                        child: Obx(
                          () => Text(
                            courselistItemModelObj.learned?.value ?? 'Learned',
                            style: theme.textTheme.labelSmall,
                          ),
                        ),
                      ),
                      // Course Count
                      Row(
                        children: [
                          Obx(
                            () => CustomImageView(
                              imagePath: courselistItemModelObj.image?.value ?? '',
                              height: 10.h,
                              width: 14.h,
                            ),
                          ),
                          SizedBox(width: 2.h),
                          Obx(
                            () => Text(
                              courselistItemModelObj.onehundredfifty?.value ?? '0',
                              style: CustomTextStyles.plusJakartaSansOnPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
