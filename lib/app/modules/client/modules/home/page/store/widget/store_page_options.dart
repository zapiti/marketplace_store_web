import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/builder/my_list_builder.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/cart_page.dart';
import 'package:marketplace_store_web/app/modules/client/modules/cart/cart_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/widget/item/item_category.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/widget/item/item_product_buy.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/widget/item/item_product_complete.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/widget/item/item_product_complete_buy.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import '../../../home_store.dart';



class StorePageOptions extends StatefulWidget {
  final HomeStore controller;

  StorePageOptions(this.controller);

  @override
  _StorePageOptionsState createState() => _StorePageOptionsState();
}

class _StorePageOptionsState extends State<StorePageOptions>  {

  final controller = Modular.get<CartStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.getBanner();
    widget.controller.getCurrentAddress();
    widget.controller.getListShops();
    widget.controller.getListCategory();
    widget.controller.getListProduct();
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
                height: 40,
                child: Observer(
                    builder: (_) => MyListBuilder(
                        scrollDirection: Axis.horizontal,
                        list: widget.controller.listCategory,
                        itemBuilder: (context, index) => ItemCategory(
                            widget.controller.listCategory[index],
                            hideImage: true)))),
            Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Utils.isSmalSize(BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width))
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  // Utils.isSmalSize(BoxConstraints(
                  //         maxWidth: MediaQuery.of(context).size.width))
                  //     ? _listShops()
                  //     :
                  _listPromotion(),
                  Utils.isSmalSize(BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width))
                      ? Expanded(child: _listProducts())
                      : _listProducts(),
                ])
          ],
        )));
  }

  Widget _listPromotion() {
    return Container(
        margin: !Utils.isSmalSize(
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
            ? EdgeInsets.only(bottom: 0)
            : EdgeInsets.all(20),
        width: !Utils.isSmalSize(
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
            ? null
            : MediaQuery.of(context).size.width * 0.30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         CartPage(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: AutoSizeText(
                "Promoçoes",
                maxLines: 1,
                minFontSize: 8,
                style: AppThemeUtils.normalSize(fontSize: 16),
              ),
            ),
            Observer(
                builder: (_) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: widget.controller.listProduct
                          ?.map<Widget>(
                              (e) => ItemProductBuy(e, widget.controller))
                          ?.toList() ?? [loadElements(width: 500)],
                    ))),
          ],
        ));
  }

  Widget _listProducts() {
    return Observer(
        builder: (_) => widget.controller.selectedProduct != null
            ? ItemProductCompleteBuy(widget.controller.selectedProduct,
                widget.controller, controller)
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 50,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (text) {},
                          onSubmitted: (term) {},
                          decoration: InputDecoration(
                              labelText: "Buscar um produto",
                              suffixIcon: Icon(Icons.search),
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              ))))),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: AutoSizeText(
                      "Todos os produtos",
                      maxLines: 1,
                      minFontSize: 8,
                      style: AppThemeUtils.normalSize(fontSize: 16),
                    ),
                  ),
                  ...widget.controller.listProduct == null
                      ? [loadElements()]
                      : widget.controller.listProduct
                          .map<Widget>(
                              (e) => ItemProductComplete(e, widget.controller))
                          .toList(),
                ],
              ));
  }
}
