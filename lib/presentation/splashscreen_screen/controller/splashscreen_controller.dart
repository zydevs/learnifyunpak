import 'pakckage:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/splashscreen_model.dart';

class SplashscreenController extends GetxController {
  Rx<SplashscreenModel> splashscreenModelObj = SplashscreenModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.loginScreen,
      );
    });
  }
}