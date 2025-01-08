import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/coursegrid_item_model.dart';

class CoursegridItemWidget extends StatelessWidget {
  final CoursegridItemModel coursegridItemModelobj;

  CoursegridItemWidget(this.coursegridItemModelobj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      decoration: AppDecoration.outlineOnprimary1.copyWith(
        borderRadius: BorderRadiusStyle.rounderBorder5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: coursegridItemModelobj.covercourse,
            height: 135.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(5.h),
          ),
          SizedBox(height: 4.h),
          Obx(
            () => Text(
              coursegridItemModelobj.namecourse.value,
              style: theme.textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4.h),
          Obx(
            () => Text(
              coursegridItemModelobj.lecturer.value,
              style: CustomTextStyles.plusJakartaSansGray600Medium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgClassIcon,
                height: 14.h,
                width: 14.h,
              ),
              SizedBox(width: 8.h),
              Obx(
                () => Text(
                  coursegridItemModelobj.catcourse.value,
                  style: CustomTextStyles.plusJakartaSansGray600Medium,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _CustomIcon(),
          ),
        ],
      ),
    );
  }
}

class _CustomIcon extends StatefulWidget {
  @override
  __CustomIconState createState() => __CustomIconState();
}

class __CustomIconState extends State<_CustomIcon> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: isClicked ? Colors.grey : Colors.purple,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            isClicked ? Icons.close : Icons.add,
            color: Colors.white,
            size: 25.0,
          ),
        ),
      ),
    );
  }
}