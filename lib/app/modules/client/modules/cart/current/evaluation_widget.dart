import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/sub_nivel/entregador_widget.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class EvaluationWidget extends StatelessWidget {
  Order order;

  EvaluationWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: entregadorWidget(order, starChange: (x) {})))),
        Container(
            padding: EdgeInsets.all(10),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: marketWidget(order, starChange: (x) {})))),
        order.hasEvaluation ? SizedBox() : lineViewWidget(),
        order.hasEvaluation
            ? SizedBox()
            : Container(
                height: 45,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: ElevatedButton(
                  child: Text(
                    "AVALIAR PEDIDO",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.whiteColor),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.colorPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                          side: BorderSide(color: AppThemeUtils.colorPrimary))),
                )),
        order.hasEvaluation
            ? SizedBox()
            : Container(
                height: 45,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: ElevatedButton(
                  child: Text(
                    "REPORTAR",
                    style: AppThemeUtils.normalSize(
                        color: AppThemeUtils.colorPrimary),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeUtils.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                          side: BorderSide(color: AppThemeUtils.colorPrimary))),
                )),
        SizedBox(height: 50,)
      ],
    );
  }
}
