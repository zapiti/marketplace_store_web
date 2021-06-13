import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/modules/login/login_store.dart';
import 'package:marketplace_store_web/app/modules/login/pages/login_entregador_page.dart';
import 'package:marketplace_store_web/app/modules/login/pages/login_pedido_page.dart';
import 'package:marketplace_store_web/app/modules/login/pages/login_produto_page.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';


class OptionsLoginPage extends StatefulWidget {

  @override
  _OptionsLoginPageState createState() => _OptionsLoginPageState();
}

class _OptionsLoginPageState extends  ModularState<OptionsLoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Observer(
            builder: (_) => Container(
                height: MediaQuery.of(context).size.height,
                child: controller.actualPage == controller.PEDIDO
                    ? LoginPedidoPage()
                    : controller.actualPage == controller.ENTREGADOR
                    ? LoginEntregadorPage()
                    : controller.actualPage == controller.PRODUTO
                    ? LoginProdutoPage()
                    : EmptyViewMobile(emptyMessage:
                    "Selecione o que deseja para iniciar!"))));
  }
}
