import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/model/order.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

import '../../order_store.dart';

class HeaderOrder extends StatelessWidget {
  final Order order;
  final OrderStore controller;

  HeaderOrder(this.order, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
                          userImage: order.shops?.image,
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
                                      order.shops?.companyName ?? '',
                                      maxLines: 1,
                                      minFontSize: 8,
                                      textAlign: TextAlign.start,
                                      style: AppThemeUtils.normalBoldSize(),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.showDetailsOrder(context,order);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: AutoSizeText(
                                          "Ver detalhes do pedido",
                                          maxLines: 1,
                                          minFontSize: 8,
                                          style: AppThemeUtils.normalSize(
                                              color:
                                                  AppThemeUtils.colorPrimary),
                                        ),
                                      ))
                                ],
                              ))),
                    ],
                  ))),
          Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ElevatedButton(
              child: Text(
                "ATUALIZAR PEDIDO",
                style:
                    AppThemeUtils.normalSize(color: AppThemeUtils.colorPrimary),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: AppThemeUtils.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(color: AppThemeUtils.colorPrimary))),
            ),
          )
        ],
      ),
    );
  }
}
