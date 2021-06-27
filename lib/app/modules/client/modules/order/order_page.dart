import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/order_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/order/widget/order_page_options.dart';

class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends ModularState<OrderPage, OrderStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getListOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWeb(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Center(
              child: Container(
                child: OrderPageOptions(controller),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
