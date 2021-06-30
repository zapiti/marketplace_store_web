

import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/modules/client/modules/bag/bag_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/current/address_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/delivery/delivery_store.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';




class DeliveryPageOptions extends StatelessWidget {
  int _processIndex = 2;
  final DeliveryStore controller;

  DeliveryPageOptions(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              margin: EdgeInsets.only(top: 20,bottom: 0),
              child: Text(
                'Seus endereços',
                style: AppThemeUtils.normalBoldSize(fontSize: 20),
              ),
            ),
            Container(
              width: 500,
              margin: EdgeInsets.only(top: 10,bottom: 20),
              child: Text(
                'Aqui voce ve os endereços para entrega dos pedidos',
                textAlign: TextAlign.start,
                style: AppThemeUtils.normalSize(fontSize: 18),
              ),
            ),
        Container(

            width: 500,
            child:  AddressWidget())
        ],),),
    );
  }
}
