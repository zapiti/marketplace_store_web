

import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/modules/client/modules/bag/bag_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/delivery/delivery_store.dart';




class DeliveryPageOptions extends StatelessWidget {
  int _processIndex = 2;
  final DeliveryStore controller;

  DeliveryPageOptions(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(child: EmptyViewMobile(emptyMessage: 'Você nao tem histórico de Entregas',),),
    );
  }
}
