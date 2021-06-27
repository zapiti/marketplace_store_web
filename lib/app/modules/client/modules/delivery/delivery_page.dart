import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/modules/client/modules/delivery/delivery_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/delivery/widget/delivery_page_options.dart';

class DeliveryPage extends StatefulWidget {

  @override
  DeliveryPageState createState() => DeliveryPageState();
}
class DeliveryPageState extends ModularState<DeliveryPage, DeliveryStore> {
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
                        child: DeliveryPageOptions(controller),
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}