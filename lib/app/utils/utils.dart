import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';


class Utils {
  static showSnackBar(String message, BuildContext context,
      {SnackBarAction action,
      int duration = 4,
      IconData icon = Icons.info_outline}) {
    Flushbar(
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: AppThemeUtils.colorPrimary,
      message: message ?? "",
      icon: Icon(
        icon,
        size: 28.0,
        color: AppThemeUtils.whiteColor,
      ),
      duration: Duration(seconds: duration),
    )..show(context);
  }

  static void hideKeyBoard(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }




}
