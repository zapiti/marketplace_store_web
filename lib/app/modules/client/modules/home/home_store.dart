import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:mobx/mobx.dart';

import 'model/my_banner.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  List<Category> listCategory;

  @observable
  List<Product> listProduct;

  @observable
  List<Product> listPromo;

  @observable
  List<Shops> listShops;

  @observable
  MyBanner banner;

  @action
  getListShops() {
    listShops = [
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops(),
      Shops()
    ];
  }

  @action
  getListCategory() {
    listCategory = [
      Category(),
      Category(),
      Category(),
      Category(),
      Category(),
      Category(),
      Category(),
      Category(),
      Category(),
      Category(),
      Category(),
      Category()
    ];
  }

  @action
  getBanner() {
    banner = MyBanner();
  }

  @action
  getListProduct() {
    listProduct = [
      Product(),
      Product(),
      Product(),
      Product(),
      Product(),
      Product(),
      Product(),
      Product(),
      Product(),
      Product(),
      Product(),
      Product()
    ];
    listPromo = listProduct;
  }
}
