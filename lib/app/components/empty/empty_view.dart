

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class EmptyView extends StatelessWidget {

  final String emptyImage;
  final String message;

  EmptyView(this.emptyImage,this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

      Container(
      child: Image.asset(emptyImage,width: 200,height: 200,)),
    Container(
      margin: EdgeInsets.all(15),
      child:Text(message,style: AppThemeUtils.normalBoldSize(),))

      ],),
    );
  }
}
