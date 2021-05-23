

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class ItemCategory extends StatelessWidget {
  final Category category;

  ItemCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,width: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(category.image),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: AutoSizeText(
                  category.description,maxLines: 1,minFontSize: 8,
                  style:
                  AppThemeUtils.normalSize(),
                ),
              )
            ],
          ),


        ],
      ),
    );
  }
}
