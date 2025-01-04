import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgBackgroundlogin,
          ),
          fit: BoxFit.fill,
        ),
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillOnPrimary1 => BoxDecoration(
      color: theme.colorScheme.onPrimary,
      image: DecorationImage(
        image: AssetImage(
          ImageConstant.imgBackgroundregis,
        ),
        fit: BoxFit.fill,
      ),
    );
  static BoxDecoration get fillOnPrimary2 => BoxDecoration(
    color: theme.colorScheme.onPrimary,
  );

  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: appTheme.black900.withOpacity(0.17),
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineOnPrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 300.h,
        ),
      );
  static BoxDecoration get outlineOnprimary1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 1.05,
        ),
      );
}


class BorderRadiusStyle {

  static BorderRadius get rounderBorder20 => BorderRadius.circular(
        20.h,
  );
  static BorderRadius get rounderBorder5 => BorderRadius.circular(
        5.h,
  );
}

