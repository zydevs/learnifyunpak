import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'controller/home_controller.dart';
import 'home_initial_page.dart';

class HomeScreen extends GetWidget<HomeCotroller> {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.gray50,
      body: SafeArea(
        child: Navigator(
          key: Get.netstedkey(1),
          initialRoute: AppRoutes.homeInitialPage,
          onGenerateRoute: (settings) => GetPageRoute(
            page: () => getCurrentPage(routeSetting.name!),
            transition: Transition.noTransition,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomNavigation(),
      ),
    );
  }

  //
  Widget _buildBottomNavigationBar() {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Get.toNamed(getCureentRoute(type), id: 1);
        },
      ),
    );
  }

  //
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeInitialPage;
      case BottomBarEnum.course:
        return "/";
      case BottomBarEnum.user:
        return "/";
      default:
        return "/";
    }
  }

  //
  Widget getCurrentPage(string currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeInitialPage:
        return HomeInitialPage();
      default:
        return DefaultWidget();
    }
  }
}
