import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:new_marketplace_web/app/components/builder/load_builder.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/home_store.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

import 'item/item_history.dart';
import 'item/item_peding.dart';

class HomePageOptions extends StatefulWidget {
  final HomeStore controller;

  HomePageOptions(this.controller);

  @override
  _HomePageOptionsState createState() => _HomePageOptionsState();
}

class _HomePageOptionsState extends State<HomePageOptions> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => LoadBuilder(
            item: widget.controller.orders,
            emptyImage: widget.controller.actualPage ==
                    widget.controller.ANDAMENTO
                ? "Seu estabelecimento ainda não recebeu pedidos. Não esqueça de atualizar os produtos da sua loja."
                : "Seu estabelecimento ainda não possui histórico de vendas",
            child: GroupedListView<Order,String>(
              elements: (((widget.controller.orders)) ?? []),
              groupBy: (element) => element.status,
              padding: EdgeInsets.only(bottom: 200),
              groupSeparatorBuilder:
                  widget.controller.actualPage == widget.controller.ANDAMENTO
                      ? _buildGroupSeparator
                      : (x) => SizedBox(),
              itemBuilder: (context, element) =>
                  widget.controller.actualPage == widget.controller.ANDAMENTO
                      ? ItemPending(element, widget.controller)
                      : ItemHistory(element, widget.controller),
              order: GroupedListOrder.DESC,
            )));
  }

  Widget _buildGroupSeparator(dynamic groupByValue) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Text(
          groupByValue == widget.controller.ANDAMENTO
              ? "Em adamento"
              : "Novo pedido!",
          maxLines: 1,
          style: AppThemeUtils.normalBoldSize(
              fontSize: 16, color: AppThemeUtils.black),
        ));
  }
}
