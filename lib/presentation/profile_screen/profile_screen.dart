import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends GetWidget<ProfileController>{
  const ProfileScreen({Key? key})
    :super(
      key: key,
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: _buildAppBar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 16.h,
                top: 8.h,
                right: 16.h,
              ),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  _buildUserInfoSection(),
                  SizedBox(height: 18.h),
                  _buildCourseInfoStack(),
                  SizedBox(height: 24.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                      left: 32.h,
                      right: 34.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgCalender,
                          height: 18.h,
                          width: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Text(
                            "lbl_calendar".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 12.h,
                          width: 8.h,
                          alignment: Alignment.bottomCenter,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 34.h),
                    child: _buildHelpCenterRow(
                      contrastImage: ImageConstant.imgTelevision,
                      helpCenterText: "lbl_my_grades".tr,
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 34.h),
                    child: _buildHelpCenterRow(
                      contrastImage:
                          ImageConstant.imgHelp,
                      helpCenterText: "lbl_help_center".tr,
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgSave,
                          height: 14.h,
                          width: 16.h,
                          alignment: Alignment.bottomCenter,
                        ),
                        Align(
                          alignment:Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text(
                              "lbl_invite_friends".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 12.h,
                          width: 8.h,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowDown,
                          height: 16.h,
                          width: 14.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Text(
                            "lbl_log_out".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 12.h,
                          width: 8.h,
                          alignment: Alignment.topCenter,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 122.h),
                  Container(
                    height: 18.h,
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 68.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "msg_privacy_policy".tr,
                          style:
                              CustomTextStyles.labelLargePlusJakartaSansGray600,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 2.h,
                            width: 2.h,
                            margin: EdgeInsets.only(
                              left: 86.h,
                              top: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: appTheme.gray600,
                              borderRadius: BorderRadius.circular(
                              1.h,
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
        ),     
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomNavigationBar(),
      ),
    );
  }

  //section widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 78.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLogoUnpak,
        margin: EdgeInsets.only(left: 14.h),
      ),
      title: AppbarSubtitle(
        text: "lbl_my_profile".tr,
        margin: EdgeInsets.only(left: 14.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotifIcon,
          height: 20.h,
          width: 20.h,
          margin: EdgeInsets.only(right: 22.h),
        )
      ],
    );
  }

  //section widget
  Widget _buildUserInfoSection(){
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPhotoUser,
            height: 100.h,
            width: 100.h,
            alignment: Alignment.center,
          ),
          SizedBox(width: 24.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "lbl_pulan".tr,
                            style: CustomTextStyles.titleLargePlusJakartaSans_1,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEditFill,
                          height: 18.h,
                          width: 20.h,
                          margin: EdgeInsets.only(top: 2.h),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "msg_065122000_student_unpak_ac_id".tr,
                    style: CustomTextStyles.labelLargePlusJakartaSansGray600,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //section widget
  Widget _buildCourseInfoStack() {
    return Container(
      height: 112.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(
              left: 26.h,
              right: 28.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: _buildCompletedCoursesRow(
                    completedCoursesText: "lbl_course_taken".tr,
                    completedCoursesCount: "lbl_4".tr,
                  ),
                ),
                SizedBox(height: 18.h),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildCompletedCoursesRow(
                    completedCoursesText: "msg_completed_courses".tr,
                    completedCoursesCount: "lbl_0".tr,
                  ),
                )
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgLine3,
            height: 112.h,
            width: double.maxFinite,
          )
        ],
      ),
    );
  }

  //section widget
  Widget _buildBottomNavigationBar() {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.toNamed(getCurrentRoute(type), id: 1);
        },
      ),
    );
  }

  //common widget
  Widget _buildHelpCenterRow({
    required String contrastImage,
    required String helpCenterText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: contrastImage,
          height: 16.h,
          width: 18.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 18.h),
          child: Text(
            helpCenterText,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onError,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 12.h,
          width: 8.h,
        )
      ],
    );
  }

  // common widget
  Widget _buildCompletedCoursesRow({
    required String completedCoursesText,
    required String completedCoursesCount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgPlus,
          height: 20.h,
          width: 22.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 14.h),
          child: Text(
            completedCoursesText,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onError,
            ),
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            completedCoursesCount,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onError,
            ),
          ),
        )
      ],
    );
  }

  //
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeInitialPage;
      case BottomBarEnum.Course:
        return "/";
      case BottomBarEnum.User:
        return "/";
      default:
        return "/";
    }
  }
}
