import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/core/request_core.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/object/object_utils.dart';

class HomeRepository {
  var _requestManager = Modular.get<RequestCore>();

  Future<List<Shops>> getListShops() async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/findAll?status=APROVADO",
      body: {},
      isObject: false,
      funcFromMap: (data) => Shops.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
    return ObjectUtils.parseToObjectList<Shops>(result.content ?? <Shops>[]) ;
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
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/product/findAllByEstablishment",
      body: {},
      isObject: false,
      funcFromMap: (data) => Product.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
    return ObjectUtils.parseToObjectList<Product>(result.content ?? <Product>[]) ;
  }

  Future<Shops> getListCurrentStore(String idShops) async {
    await Future.delayed(Duration(seconds: 1));
    return Shops();
  }
}
