import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';

import 'package:new_marketplace_web/app/modules/store/model/product.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

import '../../home_store.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final HomeStore controller;

  ItemProduct(this.product, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Card(
              child: InkWell(
                  onTap: () {
                    Modular.to.navigate(
                      ConstantsRoutes.CALL_HOME_SHOP_CLIENT_PAGE + product.id.toString(),arguments: product);
                  },
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageWidgetComponent(product.image ?? '',),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: AutoSizeText(
                          product.name ?? '',
                          maxLines: 2,
                          minFontSize: 8,
                          style: AppThemeUtils.normalBoldSize(),
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
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )))),
        ],
      ),
    );
  }
}
