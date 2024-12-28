import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/splashscreen_controller.dart';

class SplashscreenScreen extends GetWidget<SplashscreenController> {
  const SplashscreenScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            MainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMainLogo,
                height: 166.h,
                width: 172.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}