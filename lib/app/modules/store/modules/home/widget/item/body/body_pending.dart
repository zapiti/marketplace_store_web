import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/divider/line_view_widget.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/home_store.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

class BodyPending extends StatelessWidget {
  final HomeStore controller;
  final Order order;

  BodyPending(this.order, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          lineViewWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: AutoSizeText("Número do pedido",
                          textAlign: TextAlign.start,
                          minFontSize: 8,
                          style: AppThemeUtils.normalSize(fontSize: 12)),
                    ),
                    Container(
                      child: AutoSizeText("#${order.numPedido}",
                          minFontSize: 8,
                          textAlign: TextAlign.start,
                          style: AppThemeUtils.normalBoldSize(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: order.items
                        .map((e) => Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              e!.name ?? '',
                                              style: AppThemeUtils
                                                  .normalBoldSize(),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              e.description ?? '',
                                              style: AppThemeUtils.normalSize(
                                                  fontSize: 12),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              e.quantityType ?? '',
                                              style:
                                                  AppThemeUtils.normalBoldSize(
                                                      color:
                                                          AppThemeUtils.black),
                                            ),
                                          )
                                        ],
                                      )),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: ImageWidgetComponent(
                                          e.image ?? '',
                                          width: MediaQuery.of(context).size.width < 500 ? 50: 150,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                lineViewWidget()
                              ],
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 45,width: 200,
              margin: EdgeInsets.only(top: 20,left: 10,right: 10),
              child:  ElevatedButton(
                style:
                ElevatedButton.styleFrom(primary: AppThemeUtils.colorPrimary),
                onPressed: () {},
                child: Text(
                  "ACEITAR",
                  style:
                  AppThemeUtils.normalBoldSize(color: AppThemeUtils.whiteColor),
                ),
              )),
          Container(
              height: 45,width: 200,
              margin: EdgeInsets.all(20),
              child:  ElevatedButton(
                style:
                ElevatedButton.styleFrom(primary: AppThemeUtils.whiteColor),
                onPressed: () {},
                child: Text(
                  "RECUSAR",
                  style:
                  AppThemeUtils.normalBoldSize(color: AppThemeUtils.colorPrimary),
                ),
              ))
        ],
      ),
    );
  }
}
