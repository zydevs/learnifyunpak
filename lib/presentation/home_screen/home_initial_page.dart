import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_search_view.dart';
import 'controller/home_controller.dart';
import 'homeall_tab_page.dart';
import 'controller/user_controller.dart';

class HomeInitialPage extends StatelessWidget {
  HomeInitialPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // Memastikan data profil pengguna diambil saat halaman dibuka
    Get.find<UserProfileController>().fetchUserProfile();

    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.fillGray,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: _buildAppBar(),
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.h,
                      right: 18.h,
                    ),
                    child: CustomSearchView(
                      controller: controller.searchController,
                      hintText: "lbl_search".tr,
                      contentPadding: EdgeInsets.fromLTRB(14.h, 6.h, 18.h, 6.h),
                      onChanged: (value) {
                        controller.filterCourses(controller.tabIndex.value == 0
                            ? "All"
                            : controller.tabIndex.value == 1
                                ? "Required Course"
                                : "Elective Course");
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.h),
                      child: Text(
                        "lbl_categories".tr,
                        style: CustomTextStyles.titleMediumPlusJakartasans,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _buildTabView(),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabViewController,
                      children: [
                        HomeallTabPage(filter: "All"),
                        HomeallTabPage(filter: "Required Course"),
                        HomeallTabPage(filter: "Elective Course"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final userProfileController = Get.find<UserProfileController>();

    return CustomAppBar(
      leadingWidth: 78.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLogoUnpak,
        margin: EdgeInsets.only(left: 14.h),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: Obx(
          () => RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "lbl_welcome".tr,
                  style: CustomTextStyles.titleLargePlusJakartasansBlack900_1,
                ),
                TextSpan(
                  text: userProfileController.fullName.value.isNotEmpty
                      ? " ${userProfileController.fullName.value}"
                      : " User",
                  style: CustomTextStyles.titleLargePlusJakartaSans,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotifIcon,
          height: 20.h,
          width: 20.h,
          margin: EdgeInsets.only(right: 22.h),
        ),
      ],
    );
  }

  Widget _buildTabView() {
    return SizedBox(
      width: double.maxFinite,
      child: Obx(
        () => Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: TabBar(
            controller: controller.tabViewController,
            labelPadding: EdgeInsets.zero,
            labelColor: theme.colorScheme.onPrimary,
            labelStyle: TextStyle(
              fontSize: 11.fSize,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: theme.colorScheme.onPrimaryContainer,
            unselectedLabelStyle: TextStyle(
              fontSize: 11.fSize,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              _buildTab("All Course".tr, 0),
              _buildTab("Required Course".tr, 1),
              _buildTab("Elective Course".tr, 2),
            ],
            indicator: const BoxDecoration(),
            indicatorColor: Colors.transparent,
            onTap: (index) {
              controller.filterCourses(index == 0
                  ? "All"
                  : index == 1
                      ? "Required Course"
                      : "Elective Course");
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    return Tab(
      height: 32,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        decoration: controller.tabIndex.value == index
            ? BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer,
                borderRadius: BorderRadius.circular(16.h),
                border: Border.all(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 0.95.h,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(16.h),
                border: Border.all(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 0.95.h,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
        child: Text(label),
      ),
    );
  }
}
