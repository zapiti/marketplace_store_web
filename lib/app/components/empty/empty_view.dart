

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class EmptyView extends StatelessWidget {
  final String emptyImage;
  final String message;

  final IconData icon;

  EmptyView(this.emptyImage, this.message, {this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: emptyImage == null
                  ? Icon(icon ?? Icons.hourglass_empty, size: 50)
                  : Image.asset(
                      emptyImage,
                      width: 200,
                      height: 200,
                    )),
          Container(
            width: 500,
              margin: EdgeInsets.all(15),
              child: Text(
                message ?? "Sem dados",textAlign: TextAlign.center,
                style: AppThemeUtils.normalBoldSize(),
              ))
        ],
      ),
    );
  }
}
