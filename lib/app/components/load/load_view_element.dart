import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import 'load_elements.dart';

class LoadViewElement extends StatelessWidget {
  final bool isLoad;

  final Widget child;

  LoadViewElement(this.isLoad, this.child);


  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: isLoad,
        child: Stack(
          children: [
            child,
            !(isLoad)
                ? SizedBox()
                : Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.black45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    loadElements(color: AppThemeUtils.black),
                    Text(
                      "Carregando...",
                      style: AppThemeUtils.normalBoldSize(
                          color: AppThemeUtils.whiteColor),
                    )
                  ],
                )),

          ],
        ));
  }
}