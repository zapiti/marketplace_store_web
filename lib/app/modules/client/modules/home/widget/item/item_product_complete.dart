import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/divider/line_view_widget.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/home_store.dart';
import 'package:new_marketplace_web/app/modules/store/model/product.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

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
                    (product.promotionalValue ?? 0.0) == 0.0
                        ? SizedBox()
                        : Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: AutoSizeText(
                        Utils.moneyMasked(product.value),
                        maxLines: 1,
                        minFontSize: 8,
                        style: AppThemeUtils.normalSize(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: AutoSizeText(
                        Utils.moneyMasked((product.promotionalValue ?? 0.0) == 0.0
                            ? product.value
                            : (product.promotionalValue ?? 0.0)),
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
