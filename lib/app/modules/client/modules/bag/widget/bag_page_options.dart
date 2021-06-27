import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/bag/bag_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/bag/model/bag.dart';
import 'package:marketplace_store_web/app/modules/client/modules/bag/widget/finish_order/finish_order_page.dart';
import 'package:marketplace_store_web/app/modules/client/modules/delivery/delivery_store.dart';
import 'package:timelines/timelines.dart';

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
