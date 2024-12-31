import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  var _appTheme = PrefUtils().getThemeData();

  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  LighCodeColors _getThemeColors() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styeFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.cicular(5.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.secondaryContainer,
            width: 2.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray700,
      ),
    );
  }

  LightCodeCOlors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodySmall: TextStyle(
          color: appTheme.gray700,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 10.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          color: appTehem.teal150,
          fontSize: 9.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 20.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onError,
          fontSize: 14.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
      );
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
      primary: Color(0XFF083681),
      primaryContainer: Color(0XFFB1B1B1),
      secondaryContainer: Color(0xff093682),
      errorContainer: Color(0xFF7D47B4),
      onError: Color(0XFF5B17A0),
      onPrimary: Color(0xFFFFFFFFFF),
      onPrimaryContainer: Color(0XFF4B0097));
}

class LightCodeColors {
  Color get black900 => Color(0XFF00000);

  Color get blueGray100 => Color(0xFFD9D9D9);
  Color get blueDray10001 => Color(0XFFCDCDCD);
  Color get blueGray400 => Color(0XFF898989);

  Color get deepPurple100 => Color(0XFFD2BFE5);

  Color get gray50 => Color(0XFFF9FAFC);
  Color get gray600 => Color(0XFF6C6C6C);
  Color get gray700 => Color(0XFF686868);

  Color get redA700 => Color(0XFFFF0505);

  Color get teal50 => Color(0XFFD9EFF2);
  Color get teal19003f => Color(0X3F00434C);
}

