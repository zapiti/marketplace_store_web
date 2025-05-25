import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors/hex_color_utils.dart';

enum ThemeSize { BIG, MEDIUM, SMALL }

enum ThemeLayoutType { WEB, ANDROID, IOS }

class AppThemeUtils {
  final ThemeData kIOSTheme = ThemeData(
    primaryColor: Colors.grey[100],
    colorScheme: ColorScheme.light(
      primary: Colors.grey[100]!,
      brightness: Brightness.light,
    ),
  );

  final ThemeData kWebTheme = ThemeData(
    primaryColor: Colors.purple,
    colorScheme: ColorScheme.light(
      primary: Colors.purple,
      background: Colors.white,
    ),
  );

  final ThemeData kAndroidTheme = ThemeData(
    primaryColor: Colors.purple,
    colorScheme: ColorScheme.light(
      primary: Colors.purple,
      background: Colors.yellow,
    ),
  );

  static const Color colorPrimary = Color(0xFF2196F3);
  static const Color colorSecondary = Color(0xFF03A9F4);
  static const Color colorAccent = Color(0xFF00BCD4);
  static const Color colorGrayBg = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF757575);
  static const Color whiteColor = Colors.white;
  static final Color black = Colors.black;
  static final Color colorGrayLight = Colors.grey[400]!;
  static final Color orangeColor = HexColor("F06565");
  static final Color blueColor = HexColor("309AE7");
  static final Color successColor = HexColor("#479934");
  static final Color yellow = Colors.yellow[800]!;
  static final Color colorPrimaryDark = HexColor("192BC2");
  static final Color iconColor = HexColor("964015");
  static final Color colorError = HexColor("CA3838");
  static final Color completeColor = Color(0xff5e6172);
  static final Color inProgressColor = colorPrimary;
  static final Color todoColor = Color(0xffd1d2d7);

  static TextStyle bigBoldSize({Color? color}) => GoogleFonts.quicksand(
        decoration: TextDecoration.none,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle bigSize({Color? color, double fontSise = 22}) =>
      GoogleFonts.quicksand(
        decoration: TextDecoration.none,
        fontSize: fontSise,
        color: color,
      );

  static TextStyle normalSize({Color? color, double? fontSize}) {
    return TextStyle(color: color ?? darkGrey, fontSize: fontSize ?? 16);
  }

  static TextStyle normalBoldSize({Color? color, double? fontSize}) {
    return TextStyle(
      color: color ?? darkGrey,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle titleSize({Color? color, double? fontSize}) {
    return TextStyle(
      color: color ?? darkGrey,
      fontSize: fontSize ?? 24,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle subtitleSize({Color? color, double? fontSize}) {
    return TextStyle(
      color: color ?? darkGrey,
      fontSize: fontSize ?? 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle smallSize({Color? color, double fontSize = 14}) =>
      GoogleFonts.quicksand(
        decoration: TextDecoration.none,
        fontSize: fontSize,
        color: color,
      );

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: colorPrimary,
      colorScheme: ColorScheme.light(
        primary: colorPrimary,
        secondary: colorSecondary,
        surface: whiteColor,
        background: colorGrayBg,
        error: Colors.red,
      ),
      scaffoldBackgroundColor: colorGrayBg,
      appBarTheme: AppBarTheme(
        backgroundColor: colorPrimary,
        foregroundColor: whiteColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          foregroundColor: whiteColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: colorPrimary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorPrimary, width: 2),
        ),
        labelStyle: TextStyle(color: darkGrey),
      ),
    );
  }
}
