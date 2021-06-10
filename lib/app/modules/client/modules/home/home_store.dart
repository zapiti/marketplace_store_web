import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/repository/home_repository.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

import 'model/my_banner.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {

  final controllerAddressCurrent = TextEditingController();

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

  @observable
  Shops currentShops;

  @observable
  Product selectedProduct;

  final _repository = Modular.get<HomeRepository>();

  @action
  getCurrentAddress() async {
    Utils.getLocation().then((value) {
      if(value.first != null)
      controllerAddressCurrent.text = "${value.first.region}";
    });
  }

  @action
  getListShops() async {
    listShops = await _repository.getListShops();
    getCurrentAddress();
  }

  @action
  getListCategory() async {
    listCategory = await _repository.getListCategory();
  }

  @action
  getBanner() {
    banner = MyBanner();
  }

  @action
  getListProduct() async {
    listProduct = await _repository.getListProduct();
    listPromo = listProduct;
  }

  @action
  setCurrentShops(Shops myCurrentShop) async {
    currentShops = myCurrentShop;
  }

  @action
  getListCurrentStore(String idShops) async {
    currentShops = await _repository.getListCurrentStore(idShops);
  }

  @action
  setCurrentProduct(Product myCurrentProduct) async {
    selectedProduct = myCurrentProduct;
  }
}
