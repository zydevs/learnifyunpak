import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home_screen/controller/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'controller/profile_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  ProfileScreen({Key? key})
      : super(
          key: key,
        );
  
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    // Memastikan data profil pengguna diambil saat halaman dibuka
    Get.find<UserProfileController>().fetchUserProfile();

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
                  SizedBox(height: 36.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 34.h),
                    child: _buildHelpCenterRow(
                      contrastImage: ImageConstant.imgDate,
                      helpCenterText: "lbl_calendar".tr,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 34.h),
                    child: _buildHelpCenterRow(
                      contrastImage: ImageConstant.imgGrades,
                      helpCenterText: "lbl_my_grades".tr,
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 34.h),
                    child: _buildHelpCenterRow(
                      contrastImage: ImageConstant.imgHelp,
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
                          imagePath: ImageConstant.imgInvite,
                          height: 14.h,
                          width: 16.h,
                          alignment: Alignment.bottomCenter,
                        ),
                        Align(
                          alignment: Alignment.center,
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
                           onTap: () {
                            _showLogoutConfirmation(context); // Panggil metode
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            _showLogoutConfirmation(context); // Panggil metode
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text(
                              "lbl_logout".tr,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowRight,
                          height: 12.h,
                          width: 8.h,
                          alignment: Alignment.topCenter,
                           onTap: () {
                            _showLogoutConfirmation(context); // Panggil metode
                          },
                        ),
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
        // child: _buildBottomNavigationBar(),
      ),
    );
  }

  //section title page
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

  //section profile
  Widget _buildUserInfoSection() {
    // Ambil controller yang sudah diinisialisasi
    final userProfileController = Get.find<UserProfileController>();

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error fetching user data');
        }

        if (!snapshot.hasData) {
          return Text('User not found');
        }

        // Ambil nama lengkap pengguna
        String fullName = snapshot.data!['fullName'] ?? 'No Name Available';

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
                                fullName, // Ganti dengan nama lengkap pengguna
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
                        user?.email ?? "No Email Available", // Tampilkan email atau teks default jika null
                        style: CustomTextStyles.labelLargePlusJakartaSansGray600,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  //section menu 1
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                width: double.maxFinite,
                child: _buildCompletedCoursesRow(
                  completedCoursesText: "Selected Courses".tr,
                  completedCoursesCount: "lbl_4".tr,
                  iconPath: ImageConstant.imgPlus, // Tambahkan ikon plus
                ),
              ),
              SizedBox(height: 18.h),
              SizedBox(
                width: double.maxFinite,
                child: _buildCompletedCoursesRow(
                  completedCoursesText: "msg_completed_courses".tr,
                  completedCoursesCount: "lbl_0".tr,
                  iconPath: ImageConstant.imgFinish, // Tambahkan ikon selesai
                ),
              ),
            ]),
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

  //section menu 2
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

  // menu 1
  Widget _buildCompletedCoursesRow({
    required String completedCoursesText,
    required String completedCoursesCount,
    required String iconPath,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: iconPath,
          width: 20.h,
          height: 20.h,
          margin: EdgeInsets.only(right: 8.h),
        ),
        Expanded(
          child: Text(
            completedCoursesText,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onError, 
            ),
          ),
        ),
        Text(
          completedCoursesCount,
          style: theme.textTheme.titleSmall!.copyWith(
            color: theme.colorScheme.onError, 
          ),
        ),
      ],
    );
  }

  // Methode logout
  void userLogout() {
    FirebaseAuth.instance.signOut().then((_) {
      Get.toNamed(AppRoutes.loginScreen); // Arahkan ke layar login
    }).catchError((error) {
      Get.snackbar(
        "Logout Failed",
        "Error: $error",
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  // Popup logout
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                userLogout();
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  //navigasi
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
