import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/bottom_order.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/header_order.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/model/order.dart';
import 'package:timeline/model/timeline_model.dart';
import 'package:timeline/timeline.dart';

import '../order_store.dart';

class RightOrder extends StatelessWidget {
  final Order order;
  final OrderStore controller;

  RightOrder(this.order, this.controller);

  @override
  Widget build(BuildContext context) {
    return Card(
            child: order == null
                ? EmptyViewMobile(emptyMessage: "Selecione um pedido")
                : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                HeaderOrder(order, controller),
                lineViewWidget(),
                Container(
                    height: 250,
                    child: TimelineComponent(timelineList: [
                      TimelineModel(
                          id: "1",
                          description: "Seu pedido esta sendo processado",
                          title: "Pedido realizado"),
                      TimelineModel(
                          id: "1",
                          description:
                              "O estabelecimento já está cuidando do seu pedido seu pedido.",
                          title: "Confirmado"),
                      TimelineModel(
                          id: "2",
                          description: "Entregador esta á caminho",
                          title: "À caminho")
                    ])),
                  lineViewWidget(),
                  BottomOrder(order, controller)
              ]));
  }
}
