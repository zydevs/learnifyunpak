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

class MycoursesScreen extends GetWidget<MycoursesController> {
  const MycoursesScreen({Key? key})
      : super(
          key: key,
        );

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
                padding: EdgeInsets.only(
                  left: 24.h,
                  right: 18.h,
                ),
                child: CustomSearchView(
                  controller: controller.searchController,
                  hintText: 'lbl_search'.tr,
                  contentPadding: EdgeInsets.fromLTRB(14.h, 6.h, 18.h, 6.h),
                ),
              ),
              SizedBox(height: 22.h),
              _buildTabView(),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: controller.tabviewController,
                    children: [
                      MycoursesallTabPage(),
                      MycoursesallTabPage(),
                      MycoursesallTabPage()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomNavigationBar(),
      ),
    );
  }

  //section
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

  //section
  Widget _buildTabView() {
    return SizedBox(
      width: double.maxFinite,
      child: Obx(
        () => Container(
          margin: EdgeInsets.symmetric(horizontal: 14.h),
          child: TabBar(
            controller: controller.tabviewController,
            labelPadding: EdgeInsets.zero,
            labelColor: appTheme.teal50,
            labelStyle: TextStyle(
              fontSize: 11.349597930908203.fSize,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: theme.colorScheme.onPrimaryContainer,
            unselectedLabelStyle: TextStyle(
              fontSize: 11.349597930908203.fSize,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Tab(
                height: 32,
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 6.h),
                  decoration: controller.tabIndex.value == 0
                      ? BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.circular(
                            16.h,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer,
                            width: 0.95.h,
                          ))
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16.h,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer,
                            width: 0.95.h,
                          ),
                        ),
                  child: Text(
                    'lbl_all_course'.tr,
                  ),
                ),
              ),
              Tab(
                height: 32,
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 6.h),
                  decoration: controller.tabIndex.value == 1
                      ? BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.circular(
                            16.h,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer,
                            width: 0.95.h,
                          ))
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16.h,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer,
                            width: 0.95.h,
                          ),
                        ),
                  child: Text(
                    "lbl_in_progress".tr,
                  ),
                ),
              ),
              Tab(
                height: 32,
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 6.h),
                  decoration: controller.tabIndex.value == 2
                      ? BoxDecoration(
                          color: theme.colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.circular(
                            16.h,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer,
                            width: 0.95.h,
                          ))
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16.h,
                          ),
                          border: Border.all(
                            color: theme.colorScheme.onPrimaryContainer,
                            width: 0.95.h,
                          ),
                        ),
                  child: Text(
                    'lbl_completed'.tr,
                  ),
                ),
              ),
            ],
            indicatorColor: Colors.transparent,
            onTap: (index) {
              controller.tabIndex.value - index;
            },
          ),
        ),
      ),
    );
  }

  //
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
