import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import '../order_store.dart';
import 'item_order.dart';

class OrderPageOptions extends StatefulWidget {
  final OrderStore controller;

  OrderPageOptions(this.controller);

  @override
  _OrderPageOptionsState createState() => _OrderPageOptionsState();
}

class _OrderPageOptionsState extends State<OrderPageOptions> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Pedidos",
                  style: AppThemeUtils.normalBoldSize(fontSize: 22),
                )),
            Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Utils.isSmalSize(BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width))
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Utils.isSmalSize(BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width))
                      ? _listShops()
                      : _listProducts(),
                  Utils.isSmalSize(BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width))
                      ? Expanded(child: _listProducts())
                      : _listShops(),
                ])
          ],
        )));
  }

  Observer _listShops() {
    return Observer(
        builder: (_) =>  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 500,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: AutoSizeText(
                    "Pedidos anteriores",
                    maxLines: 1,
                    minFontSize: 8,
                    style: AppThemeUtils.normalSize(fontSize: 20),
                  ),
                ),
                ...widget.controller?.listOrder
                        ?.map<Widget>((e) => ItemOrder(e, widget.controller))
                        ?.toList() ??
                    [loadElements(width: 500)],
              ],
            ));
  }

  Column _listProducts() {
    return Column(
      children: [
        // Row(children: [
        //   Expanded(
        //       child: Container(
        //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //     child: AutoSizeText(
        //       "Produtos perto de você",
        //       maxLines: 1,
        //       minFontSize: 8,
        //       style: AppThemeUtils.normalSize(fontSize: 20),
        //     ),
        //   )),
        //   Container(
        //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //       child: ElevatedButton(
        //         onPressed: () {},
        //         child: Text(
        //           "Ver mais",
        //           style: AppThemeUtils.normalBoldSize(
        //               color: AppThemeUtils.colorPrimary),
        //         ),
        //         style: ElevatedButton.styleFrom(
        //             primary: Colors.transparent, elevation: 0),
        //       ))
        // ]),
        // Observer(
        //     builder: (_) => SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: Row(
        //           children: widget.controller.listProduct
        //               ?.map<Widget>((e) => ItemProduct(e, widget.controller))
        //               ?.toList() ?? [loadElements(width: 500)],
        //         ))),
        // Row(children: [
        //   Expanded(
        //       child: Container(
        //     margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        //     child: AutoSizeText(
        //       "Ofertas",
        //       maxLines: 1,
        //       minFontSize: 8,
        //       style: AppThemeUtils.normalSize(fontSize: 20),
        //     ),
        //   )),
        //   Container(
        //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        //       child: ElevatedButton(
        //         onPressed: () {},
        //         child: Text(
        //           "Ver mais",
        //           style: AppThemeUtils.normalBoldSize(
        //               color: AppThemeUtils.colorPrimary),
        //         ),
        //         style: ElevatedButton.styleFrom(
        //             primary: Colors.transparent, elevation: 0),
        //       ))
        // ]),
        // Observer(
        //     builder: (_) => SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: Row(
        //           children: widget.controller.listPromo
        //               ?.map<Widget>((e) => ItemProduct(e, widget.controller))
        //               ?.toList()??[loadElements(width: 500)],
        //         ))),
      ],
    );
  }
}
