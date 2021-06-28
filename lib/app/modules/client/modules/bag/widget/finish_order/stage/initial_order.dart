
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/tile/tile_description_button.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/current/cart_widget.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class InitialOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(child:  Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Utils.isSmalSize(BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width))
              ? Axis.horizontal
              : Axis.vertical,
          children: [
            Utils.isSmalSize(BoxConstraints(
                maxWidth:
                MediaQuery.of(context).size.width))
                ? _leftOrderWidget()
                :  _rightOrderWidget(),
            Utils.isSmalSize(BoxConstraints(
                maxWidth:
                MediaQuery.of(context).size.width))
                ? Expanded(
                child:  _rightOrderWidget())
                : _leftOrderWidget(),
          ]))

    );
  }

  _leftOrderWidget() {
    return    Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
        child:Column(
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
    child:Column(
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
        TileButtonDescription(
          title: 'Direto com o estabelecimento',
          subtitle: 'O entregador recebe e cuida do seu pedido.  ',
          trailing:
              Utils.moneyMasked(12.0),
          action: () {},
          isSelected: true,
        ),
        TileButtonDescription(
          title: 'Compra assistida',
          subtitle: 'O estabelecimento recebe e cuida do seu pedido. ',
          trailing:   Utils.moneyMasked( 6.0),
          action: () {},
          isSelected: false,
        ),
        TileButtonDescription(
          title: 'Retirar no local',
          subtitle: 'Realize o pedido no app e retire no estabelecimento.',
          trailing: 'Grátis',
          action: () {},
          isSelected: false,
        )
      ],
    ));
  }
}
