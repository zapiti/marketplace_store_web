import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_store.dart';

class OptionsMyStore extends StatelessWidget {
  MyStoreStore controller;

  OptionsMyStore(this.controller);

  @override
  Widget build(BuildContext context) {
    return  Observer(
        builder: (_) => Container(
      color: controller.actualPage == controller.HORARIO
          ? Colors.pink
          : controller.actualPage == controller.MYTEMPO
              ? Colors.grey
              : Colors.green,
    ));
  }
}
