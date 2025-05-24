import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';


Widget loadElements(
    {double size = 80,
    double width = 80,
    Color? color,
    bool isSimple = false,
    EdgeInsets? margin}) {
  return Container(
    width: width,
    height: size,
    margin: margin,
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(color ?? AppThemeUtils.colorPrimary),
      strokeWidth: 4,
    ),
  );
}
