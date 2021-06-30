import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/current/evaluation_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/model/order.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

import '../../order_store.dart';
import 'entregador_widget.dart';

class BottomOrder extends StatelessWidget {
  final Order? order;
  final OrderStore controller;

  BottomOrder(this.order, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(

        child: order!.status == Order.CONCLUIDO ? EvaluationWidget(order!): Column(
      children: [
        entregadorWidget(order),
        Image.asset(
          ImagePath.mapdefault,
          width: double.infinity,
          height: 100,
          fit: BoxFit.cover,
        ),
        lineViewWidget(),
        Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ElevatedButton(
              child: Text(
                "ENVIAR MENSAGEM",
                style:
                    AppThemeUtils.normalSize(color: AppThemeUtils.colorPrimary),
              ),
              onPressed: () {
                controller.showChatOrder(context,order);
              },
              style: ElevatedButton.styleFrom(
                  primary: AppThemeUtils.whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(color: AppThemeUtils.colorPrimary))),
            )),
        lineViewWidget(),
        Container(
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: ElevatedButton(
              child: Text(
                "Previsão de entrega: 22:36",
                style:
                    AppThemeUtils.normalSize(color: AppThemeUtils.whiteColor),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: AppThemeUtils.colorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(color: AppThemeUtils.colorPrimary))),
            )),
      ],
    ));
  }



}
