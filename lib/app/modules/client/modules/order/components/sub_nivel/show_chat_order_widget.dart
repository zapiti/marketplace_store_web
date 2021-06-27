import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/dialog/dialog_generic.dart';
import 'package:marketplace_store_web/app/components/dialog/dialog_widget.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/sub_nivel/payment_method_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/model/order.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/widget/item_product_cart.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import 'address_widget.dart';
import '../chat/widget/chat_view.dart';
import 'entregador_widget.dart';

void showChatOrderWidget(BuildContext context, Order? order) {
  showWidgetDialog(
      context: context,
      customWidget: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            entregadorWidget(order),lineViewWidget(),
        Container(
          height: MediaQuery.of(context).size.height *0.7,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child:ChatView(null)),

          ],
        ),
      ));
}
