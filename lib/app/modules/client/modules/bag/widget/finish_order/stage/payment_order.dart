

import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/current/cart_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/current/payment_widget.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class PaymentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Utils.isSmalSize(BoxConstraints(
                    maxWidth: MediaQuery
                        .of(context)
                        .size
                        .width))
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Utils.isSmalSize(
                      BoxConstraints(maxWidth: MediaQuery
                          .of(context)
                          .size
                          .width))
                      ? _leftOrderWidget()
                      : _rightOrderWidget(),
                  Utils.isSmalSize(
                      BoxConstraints(maxWidth: MediaQuery
                          .of(context)
                          .size
                          .width))
                      ? Expanded(child: _rightOrderWidget())
                      : _leftOrderWidget(),
                ])));
  }

  _leftOrderWidget() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Escolha como deseja prosseguir com o seu pedido:',
                  style: AppThemeUtils.normalBoldSize(fontSize: 20),
                ),
              ),
              CartWidget()
            ]));
  }

  _rightOrderWidget() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Selecionar pagamento',
                style: AppThemeUtils.normalBoldSize(fontSize: 20),
              ),
            ),
            PaymentWidget()
          ],
        ));
  }
}