import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/dialog/dialog_widget.dart';
import 'package:new_marketplace_web/app/components/divider/line_view_widget.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/components/sub_nivel/payment_method_widget.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/widget/item_product_cart.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

import 'address_widget.dart';

void showDetailsOrderWidget(BuildContext context, Order order) {
  showWidgetDialog(
      context: context,
      customWidget: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: getDataBodyCart(order),
      ));
}

Column getDataBodyCart(Order order) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
              child:
              buttonSelected(true, "Entrega", order.deliveryTime, () {})),
          SizedBox(
            width: 10,
          ),
          Expanded(child: buttonSelected(false, 'Agendar', null, () {}))
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: AddressWidget(),
      ),
      lineViewWidget(),
      ...order.items.map((e) => ItemProductCart(e!)),
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
  );
}

Container buttonSelected(
    bool isSelected, String title, String? subTitle, Function() onTap,{Color? color}) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 50,
      decoration: BoxDecoration(
          color: isSelected
              ? color ?? AppThemeUtils.successColor
              : AppThemeUtils.whiteColor,
          border: Border.all(
              color: isSelected
                  ? AppThemeUtils.whiteColor
                  : AppThemeUtils.colorGrayLight!,
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppThemeUtils.normalBoldSize(
                    color: isSelected
                        ? Colors.white
                        : AppThemeUtils.colorGrayLight!),
              ),
              subTitle == null
                  ? SizedBox()
                  : Text(
                      subTitle,
                      style: AppThemeUtils.normalSize(
                          color: isSelected
                              ? Colors.white
                              : AppThemeUtils.colorGrayLight!),
                    )
            ],
          )));
}
