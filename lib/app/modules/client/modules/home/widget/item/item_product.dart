import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

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
                      ConstantsRoutes.CALL_HOME_SHOP_CLIENT_PAGE + product.idShops.toString(),arguments: product);
                  },
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(product.imageUrl ?? '',),
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
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: AutoSizeText(
                          Utils.moneyMasked( product.valor),
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
