import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/home_store.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/widget/item/body/body_history.dart';
import 'package:new_marketplace_web/app/utils/date_utils.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

import 'body/body_pending.dart';

class ItemPending extends StatefulWidget {
  final Order orders;
  final HomeStore controller;


  ItemPending(this.orders, this.controller);

  @override
  _ItemPendingState createState() => _ItemPendingState();
}

class _ItemPendingState extends State<ItemPending> {
  var showBody = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: Column(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                showBody = !showBody;
              });
            },
            child: Row(
              children: [
                Container(
                    width: 120,
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        Container(
                          child: Icon(
                            widget.orders.status == Order.PEDENTE
                                ? Icons.inbox_rounded
                                : Icons.access_time_outlined,
                            size: 40,
                            color: AppThemeUtils.colorPrimary,
                          ),
                        ),
                        Container(
                            child: Text(
                          widget.orders.status == Order.PEDENTE
                              ? "Novo"
                              : "Em preparo",
                          style: AppThemeUtils.normalSize(
                              color: AppThemeUtils.colorPrimary),
                        ))
                      ],
                    )),
                widget.orders.status == Order.PEDENTE
                    ? Expanded(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                          Utils.moneyMasked(
                                                      widget.orders.value),
                                          textAlign: TextAlign.start,
                                          style: AppThemeUtils.normalBoldSize(
                                            color: AppThemeUtils.successColor,
                                          )),
                                    ),
                                    Container(
                                      child: Text(
                                          "${widget.orders.items.length} itens",
                                          style: AppThemeUtils.normalSize()),
                                    )
                                  ],
                                )),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    showBody
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_rounded,
                                    color: AppThemeUtils.successColor,
                                  ),
                                )
                              ],
                            )),
                      )
                    : Expanded(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Container(
                                        width: 120,
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                  "Pedido #${widget.orders.numPedido}",
                                                  textAlign: TextAlign.start,
                                                  style: AppThemeUtils
                                                      .normalBoldSize(
                                                    color: AppThemeUtils
                                                        .successColor,
                                                  )),
                                            ),
                                            Container(
                                              child: Text(
                                                  "há ${MyDateUtils.hoursToCompareNow(widget.orders.dtCreate)}",
                                                  style: AppThemeUtils
                                                      .normalSize()),
                                            )
                                          ],
                                        ))),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Concluir",
                                        style: AppThemeUtils.normalBoldSize(
                                            color: AppThemeUtils.successColor,
                                            fontSize: 14),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: AppThemeUtils.whiteColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              side: BorderSide(
                                                  color: AppThemeUtils
                                                      .successColor,
                                                  width: 1))),
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    showBody
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_rounded,
                                    color: AppThemeUtils.successColor,
                                  ),
                                )
                              ],
                            )),
                      )
              ],
            )),
        showBody
            ? widget.orders.status == Order.PEDENTE
                ? BodyPending(widget.orders, widget.controller)
                : BodyHistory(widget.orders, widget.controller)
            : SizedBox()
      ],
    )));
  }
}
