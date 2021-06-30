


import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/current/cart_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/sub_nivel/show_details_order_widget.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class  FinishCashOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Utils.isSmalSize(BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width))
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Utils.isSmalSize(
                      BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
                      ? _leftOrderWidget()
                      : _rightOrderWidget(),
                  Utils.isSmalSize(
                      BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
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
                'Gorjeta',
                style: AppThemeUtils.normalBoldSize(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                'Selecione o valor da gorjeta para o seu entregador',
                textAlign: TextAlign.center,
                style: AppThemeUtils.normalSize(fontSize: 18),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: buttonSelected(false, "R\$ 4,00",
                      null, () {},color:AppThemeUtils.colorPrimary)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: buttonSelected(false, 'R\$ 7,00',
                        null, () {},color:AppThemeUtils.colorPrimary)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: buttonSelected(false, 'R\$ 10,00',
                        null, () {},color:AppThemeUtils.colorPrimary)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: buttonSelected(false, 'Outros',
                        null, () {},color:AppThemeUtils.colorPrimary))
              ],
            ),
            Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "FINALIZAR PEDIDO",
                        style: AppThemeUtils.normalBoldSize(
                            color: AppThemeUtils.whiteColor),
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.colorPrimary, elevation: 0),
                ))
          ],
        ));
  }
}
