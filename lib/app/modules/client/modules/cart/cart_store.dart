import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';
import 'package:marketplace_store_web/app/utils/preferences/local_storage.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  static const CART_LIST = "CART_LIST";
  @observable
  Order order = Order();

  @action
  getTempList() async {
    var _order = await LocalDataStore.getValue(key: CART_LIST);
    if (_order != null) {
      order = Order.fromMap(jsonDecode(_order));
    }
  }

  _setTempList(Order order) {
    LocalDataStore.setData(key: CART_LIST, value: jsonEncode(order.toMap()));
  }

  Product getProductByShopping(Product product) {
    final temp = _getTempProduct(product);
    return temp ?? product;
  }

  int getQtdItemToCart(Product product) {
    final temp = _getTempProduct(product);

    return (temp ?? product).quantity ?? 0;
  }

  Product? _getTempProduct(Product product) {
    return order.items.firstWhere(
        (element) => product.name == element!.name,
        orElse: () => null);
  }

  int _getIndexTempProduct(Product product) {
    return order.items.indexOf(product);
  }

  String getMoneyValue() {
    return Utils.moneyMasked(order.items.fold(
        0,
        (previousValue, element) =>
            (element!.value! * element.quantity!) + previousValue!));
  }

  @action
  updateCart(Product product) {
    final tempList = order.items;
    final temp = _getTempProduct(product);
    if (temp == null) {
      if (product.quantity! > 0) {
        tempList.add(product);
        debugPrint("Add cart ${product.name}");
      }
    } else {
      final index = _getIndexTempProduct(temp);
      if (product.quantity! > 0) {
        tempList[index] = product;
        debugPrint("Update cart ${product.name}");
      } else {
        tempList.removeAt(index);
        debugPrint("Remove cart ${product.name}");
      }
    }
    order.items = tempList;
    _setTempList(order);
  }
}
