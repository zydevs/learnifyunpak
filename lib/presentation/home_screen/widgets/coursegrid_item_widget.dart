import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/coursegrid_item_model.dart';

class CoursegridItemWidget extends StatelessWidget {
  CoursegridItemWidget(this.coursegridItemModelObj, {Key? key})
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
      decoration: AppDecoration.outlineOnprimary1.copyWith(
        borderRadius: BorderRadiusStyle.rounderBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
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
          Obx(
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

                // Custom Icon
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      // Aksi tombol dapat ditambahkan di sini
                      print('Button Pressed!');
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent), // Hapus efek default
                    ),
                    child: _CustomIcon(),
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
          isClicked = !isClicked; // Mengubah status saat diklik
        });
      },
      child: Container(
        width: 35.0, // Ukuran lingkaran
        height: 35.0,
        decoration: BoxDecoration(
          color: isClicked ? Colors.grey : Colors.purple, // Warna lingkaran
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            isClicked ? Icons.close : Icons.add, // Ikon silang atau plus
            color: Colors.white, // Warna ikon
            size: 25.0, // Ukuran ikon
          ),
        ),
      ),
    );
  }
}

