import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';

import 'package:marketplace_store_web/app/modules/client/modules/order/order_store.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class ItemOrder extends StatelessWidget {
  final Order order;
  final OrderStore controller;

  ItemOrder(this.order, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      color:
          controller.currentOrder == order ? Colors.transparent : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: InkWell(
          onTap: () {
            controller.setCurrentOrder(order);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                                      style: AppThemeUtils.normalBoldSize(
                                          color:
                                              controller.currentOrder == order
                                                  ? AppThemeUtils.colorPrimary
                                                  : null),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: AutoSizeText(
                                          Utils.moneyMasked(
                                              order.shops.valueDelivery),
                                          maxLines: 1,
                                          minFontSize: 8,
                                          style: AppThemeUtils.normalSize(),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ))),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: AutoSizeText(
                          order.status,
                          maxLines: 1,
                          minFontSize: 8,
                          textAlign: TextAlign.start,
                          style: AppThemeUtils.normalSize(color:      controller.currentOrder == order
                              ? AppThemeUtils.colorPrimary
                              : null),
                        ),
                      ),
                    ],
                  )),
              lineViewWidget()
            ],
          )),
    );
  }
}
