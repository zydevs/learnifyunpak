import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/splashscreen_controller.dart';

class SplashscreenScreen extends GetWidget<SplashscreenController> {
  const SplashscreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Timer untuk transisi ke AuthPage setelah 3 detik
    Timer(Duration(seconds: 3), () {
      // Arahkan ke AuthPage setelah 3 detik
      Get.offNamed(AppRoutes.authPage);
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo atau gambar splash screen
              CustomImageView(
                imagePath: ImageConstant.imgMainLogo,
                height: 166.h, 
                width: 172.h,  
              ),
            ],
          ),
        ),
      ),
    );
  }
}
