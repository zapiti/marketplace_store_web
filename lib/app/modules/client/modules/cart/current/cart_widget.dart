



import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/cart_store.dart';

import 'item/item_product_cart.dart';

class CartWidget extends StatelessWidget {
 final controller = Modular.get<CartStore>();

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    ... controller.listProductCart
        .map<Widget>(
    (e) => ItemProductCart(e!, controller))
        .toList() ,
      ],
    );
  }
}
