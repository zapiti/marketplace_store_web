import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/components/plus_less/build_plus_less_button.dart';
import 'package:new_marketplace_web/app/modules/client/modules/cart/cart_store.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/home_store.dart';

import 'package:new_marketplace_web/app/modules/store/model/product.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

class ItemProductCompleteBuy extends StatelessWidget {
  final Product? product;
  final HomeStore controller;
  final CartStore cartController;

  ItemProductCompleteBuy(this.product, this.controller,this.cartController);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.all(10),
              child: ImageWidgetComponent(
                product?.image ?? '',
                width: double.infinity,
                height: 200,
              )),
          Container(
              child: Row( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AutoSizeText(
                    product?.name ?? '',
                    maxLines: 2,
                    minFontSize: 8,
                    style: AppThemeUtils.normalBoldSize(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AutoSizeText(
                    product?.description ?? '',
                    minFontSize: 8,
                    style: AppThemeUtils.normalSize(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: AutoSizeText(
                    Utils.moneyMasked( product?.value),
                    maxLines: 1,
                    minFontSize: 8,
                    style: AppThemeUtils.normalBoldSize(
                        color: AppThemeUtils.successColor),
                  ),
                ),
                buildPlusLessButton(context, product!,cartController),
                Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.setCurrentProduct(null);
                      },
                      child: Text(
                        "Voltar comprar",
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.colorPrimary),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, elevation: 0),
                    )),
              ],
            ))
          ]))
        ],
      ),
    );
  }
}
