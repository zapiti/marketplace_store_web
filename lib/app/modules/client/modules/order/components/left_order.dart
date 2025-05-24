import 'package:auto_size_text_pk/auto_size_text_pk.dart';

import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/load/load_elements.dart';

import 'package:new_marketplace_web/app/modules/client/modules/order/widget/item_order.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import '../order_store.dart';

class LeftOrder extends StatelessWidget {
  final Order? order;
  final OrderStore controller;

  LeftOrder(this.order, this.controller);

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 500,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: AutoSizeText(
                  "Pedidos anteriores",
                  maxLines: 1,
                  minFontSize: 8,
                  style: AppThemeUtils.normalSize(fontSize: 20),
                ),
              ),
              ...controller.listOrder
                      ?.map<Widget>((e) => ItemOrder(e, controller)).toList() ??
                  [loadElements(width: 500)],
            ],
          );
  }
}
