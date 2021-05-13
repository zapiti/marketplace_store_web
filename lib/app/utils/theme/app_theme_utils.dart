import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors/hex_color_utils.dart';

enum ThemeSize { BIG, MEDIUM, SMALL }
enum ThemeLayoutType { WEB, ANDROID, IOS }

class AppThemeUtils {
  final ThemeData kIOSTheme = ThemeData(
    //   primarySwatch: Theme.of(context).primaryColor,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
    //  backgroundColor: Theme.of(context).primaryColor,
  );

  final ThemeData kWebTheme = ThemeData(
    primarySwatch: Colors.purple,
    // accentColor: Theme.of(context).primaryColor,
    backgroundColor: Colors.white,
  );

  final ThemeData kAndroidTheme = ThemeData(
    primarySwatch: Colors.purple,
    // accentColor: Theme.of(context).primaryColor,
    backgroundColor: Colors.yellow,
  );

  static var colorGrayLight = Colors.grey[400];

  static Color orangeColor = HexColor("F06565");
  static Color blueColor = HexColor("309AE7");

  static var whiteColor = Colors.white;

  static var colorGrayBg = HexColor("F4F5F5");

  //static var grey = Colors.grey;

  static TextStyle bigBoldSize({Color color}) => GoogleFonts.quicksand(
      decoration: TextDecoration.none,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color);

  static TextStyle bigSize({Color color, double fontSise = 22}) =>
      GoogleFonts.quicksand(
          decoration: TextDecoration.none, fontSize: fontSise, color: color);

  static TextStyle normalBoldSize({Color color, double fontSize = 14}) =>
      GoogleFonts.quicksand(
          decoration: TextDecoration.none,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color);

  static TextStyle normalSize({
    Color color,
    double fontSize = 14,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      GoogleFonts.quicksand(
          decoration: decoration,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color);

  static TextStyle smallSize({Color color, double fontSize = 14}) =>
      GoogleFonts.quicksand(
          decoration: TextDecoration.none, fontSize: fontSize, color: color);

  static Color colorPrimary = HexColor("33C9BE");
  static Color colorPrimaryDark = HexColor("49CEC5");
  static Color colorPrimarylight = HexColor("77DAD3");
  static Color colorPrimarylight2 = HexColor("BBEDEA");
  static Color colorSecundary = HexColor("#E78755");
  static Color colorSecundaryLight = HexColor("#E78755");
  static Color iconColor = HexColor("964015");
  static Color black = HexColor("313534");
  static Color darkGrey = HexColor("ADAEAE");
  static Color colorError = HexColor("CA3838");
  // static Color colorTextLight = HexColor("8A7776");


}


