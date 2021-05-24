import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';

class HomeRepository {
  Future<List<Shops>> getListShops() async {

   await Future.delayed(Duration(seconds: 1));

    return [
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

  Future<List<Category>> getListCategory() async {
    await Future.delayed(Duration(seconds: 1));
    return [
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

  Future<List<Product>> getListProduct() async {
    await Future.delayed(Duration(seconds: 1));
    return [
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
  }

  Future<Shops> getListCurrentStore(String idShops) async{
    await Future.delayed(Duration(seconds: 1));
    return Shops();
  }
}
