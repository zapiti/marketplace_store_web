import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:new_marketplace_web/app/components/empty/empty_view.dart';
import 'package:new_marketplace_web/app/modules/register/pages/register_entregador_page.dart';
import 'package:new_marketplace_web/app/modules/register/pages/register_pedido_page.dart';
import 'package:new_marketplace_web/app/modules/register/pages/register_produto_page.dart';
import 'package:new_marketplace_web/app/modules/register/register_store.dart';
import 'package:new_marketplace_web/app/utils/image/image_path.dart';


class OptionsRegisterPage extends StatefulWidget {
  OptionsRegisterPage();

  @override
  _OptionsRegisterPageState createState() => _OptionsRegisterPageState();
}

class _OptionsRegisterPageState
    extends ModularState<OptionsRegisterPage, RegisterStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Observer(
            builder: (_) => Container(
                height: MediaQuery.of(context).size.height,
                child: controller.actualPage == controller.PEDIDO
                    ? RegisterPedidoPage()
                    : controller.actualPage == controller.ENTREGADOR
                        ? RegisterEntregadorPage()
                        : controller.actualPage == controller.PRODUTO
                            ? RegisterProdutoPage()
                            : EmptyViewMobile(emptyMessage:
                                "Selecione o que deseja para iniciar!"))));
  }
}
