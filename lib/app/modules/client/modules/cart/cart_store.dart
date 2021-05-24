import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  List<Product> listProductCart = [];

  Product getProductByShopping(Product product) {
    final temp = _getTempProduct(product);

    return temp ?? product;
  }

  int getQtdItemToCart(Product product) {
    final temp = _getTempProduct(product);

    return (temp ?? product).qtd ?? 0;
  }

  Product _getTempProduct(Product product) {
    return listProductCart.firstWhere((element) => product.name == element.name,
        orElse: () => null);
  }

  int _getIndexTempProduct(Product product) {
    return listProductCart.indexOf(product);
  }

  String getMoneyValue() {
    return Utils.moneyMasked(listProductCart.fold(
        0,
        (previousValue, element) =>
            (element.valor * element.qtd) + previousValue));
  }

  @action
  updateCart(Product product) {
    final tempList = listProductCart;
    final temp = _getTempProduct(product);
    if (temp == null) {
      if (product.qtd > 0) {
        tempList.add(product);
        debugPrint("Add cart ${product.name}");
      }
    } else {
      final index = _getIndexTempProduct(temp);
      if (product.qtd > 0) {
        tempList[index] = product;
        debugPrint("Update cart ${product.name}");
      } else {
        tempList.removeAt(index);
        debugPrint("Remove cart ${product.name}");
      }
    }
    listProductCart = tempList;
  }
}
