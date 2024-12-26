import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/coursegrid_item_model.dart';

//
class CoursegridItemWidget extends StatefulWidget{
  CoursegridItemModel(this.coursegridItemModelObj, {Key? key})
      : super(
        key: key, 
        );

  CoursegridItemModel coursegridItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      decoration: AppDecoration.outlinedOnPrimary1.copywith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          obx(
            () => CustomImageView(
              imagePath: coursegridItemModelObj.covercourse!.value,
              height: 100.h,
              width: double.maxFinite,
              radius: BorderRadius.circular(
                5.h,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          obx(
            () => Text(
              coursegridItemModelObj.namecourse!.value,
              style: theme.textTheme.labelMedium,
            ),
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          coursegridItemModelObj.lecturer!.value,
                          style: CustomTextStyles.plusJakartaSansGray600Medium,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgClassIcon,
                              height: 14.h,
                              width: 14.h,
                              alignment: Alignment.center,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: Obx(
                                () => Text(
                                  coursegridItemModelObj.catcourse!.value,
                                  style: CustomTextStyles
                                      .plusJakartaSansGray600Medium,
                                ),
                              ),
                            )
                          ],    
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: () {}, 
                    constraints: BoxConstraints(
                      minHeight: 22.h,
                      minWidth: 22.h,
                    ),
                    padding: EdgeInsets.all(0),
                    icon: Container(
                      width: 22.h,
                      height: 22.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imageNotFound,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.h)          
        ],
      ),
    );
  }
}