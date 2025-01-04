import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get microsoftSansSerif {
    return copyWith(
      fontFamily: 'Microsoft Sans Serif',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}




class CustomTextStyles {
  
  static TextStyle get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static TextStyle get bodySmallMicrosoftSansSerifRedA700 =>
      theme.textTheme.bodySmall!.microsoftSansSerif.copyWith(
        color: appTheme.redA700,
      );
  static TextStyle get bodySmallPlusJakartaSansBluegray400 =>
      theme.textTheme.bodySmall!.plusJakartaSans.copyWith(
        color: appTheme.blueGray400,
        fontSize: 12.fSize,
      );
//label text style
  static TextStyle get labelLargePlusJakartaSansGray600 =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  static TextStyle get labelLargeSecondaryContainer =>
      theme.textTheme.labelLarge!.plusJakartaSans.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get labelMediumInterOnPrimary =>
      theme.textTheme.labelMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static TextStyle get labelMediumOnPrimary =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelMediumSemiBold =>
      theme.textTheme.labelMedium!.copyWith(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelMediumTeal50 =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.teal50,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelSmallGray600 =>
      theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray600,
      );
// plus text style
  static TextStyle get plusJakartaSansGray600 => TextStyle(
        color: appTheme.gray600,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w500,
      ).plusJakartaSans;
  static TextStyle get plusJakartaSansGray600Medium => TextStyle(
        color: appTheme.gray600,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).plusJakartaSans;
  static TextStyle get plusJakartaSansGray600Medium7 => TextStyle(
        color: appTheme.gray600,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).plusJakartaSans;
  static TextStyle get plusJakartaSansOnPrimaryContainer => TextStyle(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).plusJakartaSans;

  static get titleLargePlusJakartaSans =>
      theme.textTheme.titleLarge!.plusJakartaSans;
  static TextStyle get titleLargePlusJakartaSansBlack900 =>
      theme.textTheme.titleLarge!.plusJakartaSans.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get titleLargePlusJakartasansBlack900_1 =>
      theme.textTheme.titleLarge!.plusJakartaSans.copyWith(
        color: appTheme.black900,
      );
  static get titleLargePlusJakartaSans_1 =>
      theme.textTheme.titleLarge!.plusJakartaSans;
  static TextStyle get titleMediumPlusJakartasans =>
      theme.textTheme.titleMedium!.plusJakartaSans.copyWith(
        fontSize: 19.fSize,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
}
