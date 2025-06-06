

import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/bag_store.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/model/bag.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/widget/finish_order/finish_order_page.dart';

class BagPageOptions extends StatelessWidget {
  final controller = Modular.get<BagStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.actualPageBag == Bag.BAGFINISH
              ? FinishOrder()
              : SizedBox(),
    );
  }
}
