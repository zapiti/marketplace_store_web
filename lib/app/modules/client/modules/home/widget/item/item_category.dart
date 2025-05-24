import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/model/category.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class ItemCategory extends StatelessWidget {
  final Category category;

  final bool hideImage;

  ItemCategory(this.category, {this.hideImage = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          height: hideImage ? null : 120,
          width: hideImage ? null : 150,  padding: EdgeInsets.all(5),
          child: Stack(
            children: [
              hideImage
                  ? SizedBox()
                  : category.image == null
                      ? SizedBox()
                      : Container(

                  child:  ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            category.image!,
                            height: hideImage ? null : 110,
                            width: hideImage ? null : 150,
                            fit: BoxFit.cover,
                          ))),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(

                    width: hideImage ? null : 150,decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: AutoSizeText(
                      category.description,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 8,
                      style: AppThemeUtils.normalBoldSize(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ));
  }
}
