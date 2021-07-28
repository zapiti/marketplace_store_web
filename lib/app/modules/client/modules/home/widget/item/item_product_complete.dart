import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/home_store.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class ItemProductComplete extends StatelessWidget {
  final Product product;
  final HomeStore controller;

  ItemProductComplete(this.product, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                controller.setCurrentProduct(product);
              },
              child: Container(
                  child: Row(children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: AutoSizeText(
                        product.name ?? '',
                        maxLines: 2,
                        minFontSize: 8,
                        style: AppThemeUtils.normalBoldSize(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: AutoSizeText(
                        product.description ?? '',
                        minFontSize: 8,
                        style: AppThemeUtils.normalSize(),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: AutoSizeText(
                        Utils.moneyMasked( product.value, )
                            ,
                        maxLines: 1,
                        minFontSize: 8,
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.successColor),
                      ),
                    ),
                  ],
                )),
                Container(
                    margin: EdgeInsets.all(10),
                    child: ImageWidgetComponent(
                      product.image ?? '',
                      width: 100,
                      height: 100,
                    )),
              ]))),
          lineViewWidget()
        ],
      ),
    );
  }
}
