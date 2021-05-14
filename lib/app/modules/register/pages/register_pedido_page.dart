import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/modules/register/register_store.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';

class RegisterPedidoPage extends StatefulWidget {
  @override
  _RegisterPedidoPageState createState() => _RegisterPedidoPageState();
}

class _RegisterPedidoPageState
    extends ModularState<RegisterPedidoPage, RegisterStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: EmptyView(ImagePath.imageEmpty, "Em construção"),
      ),
    );
  }
}
