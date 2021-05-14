import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

Container loadElements(
    {double size = 200,
    double width = double.infinity,
    Color color,
    bool isSimple = false,
    EdgeInsets margin}) {
  return Container(
    width: width,
    height: size,
    margin: margin,
    color: color,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(AppThemeUtils.colorPrimary),
      strokeWidth: 4,
    ),
  );
}
