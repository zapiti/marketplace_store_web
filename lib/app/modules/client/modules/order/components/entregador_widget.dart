


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/model/order.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

Row entregadorWidget(Order order) {
  return Row(
    children: [
      Expanded(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: UserImageWidget(
                      changeImage: (txt) {},
                      enable: false,
                      width: 80,
                      height: 80,
                      isRounded: true,
                      userImage: order.shops.image,
                    ),
                  ),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: AutoSizeText(
                                  order.shops.name,
                                  maxLines: 1,
                                  minFontSize: 8,
                                  textAlign: TextAlign.start,
                                  style: AppThemeUtils.normalBoldSize(),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: AutoSizeText(
                                  "Seu entregador",
                                  maxLines: 1,
                                  minFontSize: 8,
                                  style: AppThemeUtils.normalSize(),
                                ),
                              )
                            ],
                          ))),
                ],
              ))),
      Container(
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Icon(
            Icons.star,
            color: AppThemeUtils.yellow,
          )),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Text(
          "4.9",
          style:
          AppThemeUtils.normalBoldSize(color: AppThemeUtils.yellow),
        ),
      ),SizedBox(width: 50,)
    ],
  );
}