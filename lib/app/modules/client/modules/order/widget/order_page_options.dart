import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_marketplace_web/app/components/empty/empty_view.dart';
import 'package:new_marketplace_web/app/components/load/load_elements.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/components/left_order.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/components/right_order.dart';
import 'package:new_marketplace_web/app/modules/client/modules/order/model/order.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

import '../order_store.dart';
import 'item_order.dart';

class OrderPageOptions extends StatefulWidget {
  final OrderStore controller;

  OrderPageOptions(this.controller);

  @override
  _OrderPageOptionsState createState() => _OrderPageOptionsState();
}

class _OrderPageOptionsState extends State<OrderPageOptions> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Pedidos",
                  style: AppThemeUtils.normalBoldSize(fontSize: 22),
                )),
            Observer(
                builder: (_) => (widget.controller.listOrder ?? [Order()])
                        .isEmpty
                    ? Card(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 500,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: AutoSizeText(
                              "Pedidos anteriores",
                              maxLines: 1,
                              minFontSize: 8,
                              style: AppThemeUtils.normalSize(fontSize: 20),
                            ),
                          ),
                          Container(
                              width: 500,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: EmptyViewMobile(
                                  emptyMessage: "Você ainda não fez pedidos"))
                        ],
                      ))
                    : Flex(
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
                                ? LeftOrder(widget.controller.currentOrder,
                                    widget.controller)
                                : RightOrder(widget.controller.currentOrder,
                                    widget.controller),
                            Utils.isSmalSize(BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width))
                                ? Expanded(
                                    child: RightOrder(
                                        widget.controller.currentOrder,
                                        widget.controller))
                                : LeftOrder(widget.controller.currentOrder,
                                    widget.controller),
                          ]))
          ],
        )));
  }
}
