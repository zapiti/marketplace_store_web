import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/dialog/dialog_generic.dart';
import 'package:marketplace_store_web/app/components/dialog/dialog_widget.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/payment_method_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/model/order.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/widget/item_product_cart.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import 'address_widget.dart';

void showDetailsOrderWidget(BuildContext context, Order order) {
  showWidgetDialog(
      context: context,
      customWidget: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: AddressWidget(),
            ),
            lineViewWidget(),
            ...order.products.map((e) => ItemProductCart(e)),
            InkWell(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Text("Adicionar mais itens",
                      textAlign: TextAlign.center,
                      style: AppThemeUtils.normalBoldSize(
                          color: AppThemeUtils.colorPrimary))),
            ),
            lineViewWidget(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Resumo do pedido",
                style: AppThemeUtils.normalBoldSize(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Subtotal",
                    style: AppThemeUtils.normalSize(),
                  )),
                  Container(
                    child: Text(
                      Utils.moneyMasked(50),
                      style: AppThemeUtils.normalSize(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Entrega",
                    style: AppThemeUtils.normalSize(),
                  )),
                  Container(
                    child: Text(
                      Utils.moneyMasked(2),
                      style: AppThemeUtils.normalSize(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Total",
                    style: AppThemeUtils.normalBoldSize(),
                  )),
                  Container(
                    child: Text(
                      Utils.moneyMasked(52),
                      style: AppThemeUtils.normalBoldSize(),
                    ),
                  ),
                ],
              ),
            ),
            lineViewWidget(),
            PaymentMethodWidget(),
          ],
        ),
      ));
}
