


import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';
import 'package:marketplace_store_web/app/utils/date_utils.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import '../../home_store.dart';
import 'body/body_history.dart';
class ItemHistory extends StatefulWidget {
  final HomeStore controller;
  final Order orders;

  ItemHistory(this.orders, this.controller);
  @override
  _ItemHistoryState createState() => _ItemHistoryState();
}

class _ItemHistoryState extends State<ItemHistory> {
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
                                 Icons.check,
                                    size: 40,
                                    color: AppThemeUtils.black,
                                  ),
                                ),
                                Container(
                                    child: Text(
                                    "Concluído",
                                      style: AppThemeUtils.normalSize(
                                          color: AppThemeUtils.black),
                                    ))
                              ],
                            )),
                     Expanded(
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
                                                          .black,
                                                    )),
                                              ),
                                              Container(
                                                child: Text(
                                                    "${MyDateUtils.parseDateTimeFormat(widget.orders.dtCreate)}",
                                                    style: AppThemeUtils
                                                        .normalSize()),
                                              ),

                                            ],
                                          ))),
                          
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: Icon(
                                      showBody
                                          ? Icons.keyboard_arrow_up_outlined
                                          : Icons.keyboard_arrow_down_rounded,
                                      color: AppThemeUtils.black,
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    )),
                showBody
                    ?  BodyHistory(widget.orders, widget.controller)
                    : SizedBox()
              ],
            )));
  }
}
