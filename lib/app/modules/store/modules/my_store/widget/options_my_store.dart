import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/store/store_hours.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/store/store_phone.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/store/store_prepar_time.dart';

class OptionsMyStore extends StatelessWidget {
  MyStoreStore controller;

  OptionsMyStore(this.controller);

  @override
  Widget build(BuildContext context) {
    return  Observer(
        builder: (_) => Container(
      child: controller.actualPage == controller.HORARIO
          ? StoreHours()
          : controller.actualPage == controller.MYTEMPO
              ? StorePreparTime(controller)
              : StorePhone(controller),
    ));
  }
}
