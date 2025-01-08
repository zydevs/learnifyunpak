import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_search_view.dart';
import 'controller/mycourses_controller.dart';
import 'mycoursesall_tab_page.dart';

class MycoursesScreen extends StatelessWidget {
  final MycoursesController controller = Get.find<MycoursesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.onPrimary,
      appBar: _buildAppBar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomSearchView(
                        controller: controller.searchController,
                        hintText: 'lbl_search'.tr,
                        contentPadding: EdgeInsets.fromLTRB(14.h, 6.h, 18.h, 6.h),
                        onChanged: (query) {
                          controller.searchController.text = query;
                          controller.searchController.notifyListeners();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Container(
                  child: Obx(() {
                    var courses = controller.mycoursesallTabModelObj.value.courselistItemList.value;
                    return TabBarView(
                      controller: controller.tabviewController,
                      children: [
                        MycoursesallTabPage(),
                        MycoursesallTabPage(),
                        MycoursesallTabPage()
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 78.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLogoUnpak,
        margin: EdgeInsets.only(left: 14.h),
      ),
      title: AppbarSubtitle(
        text: 'lbl_my_courses'.tr,
        margin: EdgeInsets.only(left: 17.h),
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