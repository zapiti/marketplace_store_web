import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import '../../home_store.dart';

class ItemProductBuy extends StatelessWidget {
  final Product product;
  final HomeStore controller;

  ItemProductBuy(this.product, this.controller);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Card(
              child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageWidgetComponent(product.image?? '',),
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: AutoSizeText(
                              product.name?? '',
                              maxLines: 2,
                              minFontSize: 8,
                              style: AppThemeUtils.normalBoldSize(),
                            ),
                          ),
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                            child: AutoSizeText(
                              Utils.moneyMasked( product.value),
                              maxLines: 1,
                              minFontSize: 8,
                              style: AppThemeUtils.normalBoldSize(
                                  color: AppThemeUtils.successColor),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: ElevatedButton(
                              child: Text(
                                "ADICIONAR",
                                style:
                                AppThemeUtils.normalSize(
                                    color: AppThemeUtils.colorPrimary),
                              ),
                              onPressed: () {

                              },
                              style: ElevatedButton.styleFrom(
                                  primary: AppThemeUtils.whiteColor,
                                  shape: RoundedRectangleBorder(borderRadius:
                                  new BorderRadius.circular(4.0),
                                      side: BorderSide(
                                          color: AppThemeUtils.colorPrimary))),
                            ),
                          )
                        ],
                      ))),
        ],
      ),
    );
  }
}
