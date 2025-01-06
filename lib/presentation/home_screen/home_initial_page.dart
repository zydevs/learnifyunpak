import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_search_view.dart';
import 'controller/home_controller.dart';
import 'homeall_tab_page.dart';
import 'models/home_initial_model.dart';

// ignore_for_file: must_be_immutable
class HomeInitialPage extends StatelessWidget {
  HomeInitialPage({Key? key})
      : super(
          key: key,
        );

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.h,
                      right: 18.h,
                    ),
                    child: CustomSearchView(
                      controller: controller.searchController,
                      hintText: "lbl_search".tr,
                      contentPadding: EdgeInsets.fromLTRB(14.h, 6.h, 18.h, 6.h),
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
                    child: Container(
                      child: TabBarView(
                        controller: controller.tabViewController,
                        children: [
                          HomeallTabPage(),
                          HomeallTabPage(),
                          HomeallTabPage()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 78.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLogoUnpak,
        margin: EdgeInsets.only(left: 14.h),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 15.h),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "lbl_welcome".tr,
                style: CustomTextStyles.titleLargePlusJakartasansBlack900_1,
              ),
              TextSpan(
                text: "lbl_pulan".tr,
                style: CustomTextStyles.titleLargePlusJakartaSans,
              )
            ],
          ),
          textAlign: TextAlign.left,
        ),
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

  // filter course
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
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ))
                      : BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16.h,
                        ),
                        border: Border.all(
                          color: theme.colorScheme.onPrimaryContainer,
                          width: 0.95,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                  child: Text(
                    "lbl_all_course".tr,
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
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ))
                      : BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16.h,
                        ),
                        border: Border.all(
                          color: theme.colorScheme.onPrimaryContainer,
                          width: 0.95,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                  child: Text(
                    "lbl_required_course".tr,
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
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ))
                      : BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16.h,
                        ),
                        border: Border.all(
                          color: theme.colorScheme.onPrimaryContainer,
                          width: 0.95,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                  child: Text(
                    "lbl_elective_course".tr,
                  ),
                ),
              )
            ],
            indicator: const BoxDecoration(), // Menghapus garis bawah (default indicator)
            indicatorColor: Colors.transparent, // Back-up pengaturan
            onTap: (index) {
              controller.tabIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}