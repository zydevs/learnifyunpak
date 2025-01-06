import 'package:flutter/material.dart';
import 'package:learnifyunpak/presentation/home_screen/binding/home_binding.dart';
import 'package:learnifyunpak/presentation/mycourses_screen/binding/mycourses_binding.dart';
import 'package:learnifyunpak/presentation/mycourses_screen/mycourses_screen.dart';
import 'package:learnifyunpak/presentation/profile_screen/profile_screen.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'controller/home_controller.dart';
import 'home_initial_page.dart';

class HomeScreen extends GetWidget<HomeController> {
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
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.homeInitialPage,
          onGenerateRoute: (routeSetting) => GetPageRoute(
            page: () => getCurrentPage(routeSetting.name!),
            transition: Transition.noTransition,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomNavigationBar(),
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
        return AppRoutes.mycoursesScreen;
      case BottomBarEnum.User:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }

  //
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeInitialPage:
        return HomeInitialPage();
      case AppRoutes.mycoursesScreen:
        return MycoursesScreen();
      case AppRoutes.profileScreen:
        return ProfileScreen();
      default:
        return DefaultWidget();
    }
  }
}
