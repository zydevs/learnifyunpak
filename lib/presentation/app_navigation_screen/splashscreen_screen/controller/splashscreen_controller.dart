import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/splashscreen_model.dart';

/// A controller class for the SplashscreenScreen.
/// 
/// This class manages the state of the SplashscreenScreen, including the
/// current splashscreenModelObj
class SplashscreenController extends GetxController {
  Rx<SplashscreenModel> splashscreenModelObj = Splashscreenmodel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.loginScreen,
      );
    });
  }
}