import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/cart_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/components/sub_nivel/show_details_order_widget.dart';

class CartWidget extends StatelessWidget {
  final controller = Modular.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20),
        margin: EdgeInsets.only(bottom: 50),
        child: getDataBodyCart(controller.order));
  }
}
