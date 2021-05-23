import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/home_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class ItemShops extends StatelessWidget {
  final Shops shops;
  final HomeStore controller;

  ItemShops(this.shops,this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child:InkWell(
          onTap: (){
            controller.setCurrentShops(shops);
            Modular.to.navigate(
                ConstantsRoutes.CALL_HOME_SHOP_CLIENT_PAGE + shops.id.toString(),);

          },
          child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                shops.image,
                width: 100,
                height: 100,
              ),
              Expanded(
                  child: Container(

                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: AutoSizeText(
                      shops.name,
                      maxLines: 1,
                      minFontSize: 8,textAlign: TextAlign.start,
                      style: AppThemeUtils.normalBoldSize(),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: AutoSizeText(
                      "Loja - ${shops.distanceKm}km",
                      maxLines: 1,
                      minFontSize: 8,
                      style: AppThemeUtils.normalSize(),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: AutoSizeText(
                          MoneyMaskedTextController(
                                  initialValue: shops.valueDelivery,
                                  leftSymbol: "R\$")
                              .text,
                          maxLines: 1,
                          minFontSize: 8,
                          style: AppThemeUtils.normalSize(
                              color: AppThemeUtils.successColor),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: AutoSizeText(
                          "  30-40min",
                          maxLines: 1,
                          minFontSize: 8,
                          style: AppThemeUtils.normalSize(),
                        ),
                      ))
                    ],
                  )
                ],
              )))
            ],
          ),lineViewWidget()
        ],
      )),
    );
  }
}
