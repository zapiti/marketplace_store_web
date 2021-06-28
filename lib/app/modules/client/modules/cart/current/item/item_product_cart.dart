import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/cart_store.dart';

import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';



class ItemProductCart extends StatelessWidget {
  final Product product;
  final CartStore controller;

  ItemProductCart(this.product, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child:   Container(
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
                        minFontSize: 12,
                        style: AppThemeUtils.normalBoldSize(fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: AutoSizeText(
                        product.descricao ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 12,
                        style: AppThemeUtils.normalSize(fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: AutoSizeText(
                        Utils.moneyMasked(
                          product.valor,
                        ),
                        maxLines: 1,
                        minFontSize: 12,
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.successColor,fontSize: 20),
                      ),
                    ),
                  ],
                )),   Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  product.imageUrl ?? '',
                  width: 80,
                  height: 80,
                )),
          ])),
    );
  }
}
