import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/core/request_core.dart';
import 'package:marketplace_store_web/app/models/current_user.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/shops.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/image/image_path.dart';
import 'package:marketplace_store_web/app/utils/object/object_utils.dart';

class HomeRepository {
  var _requestManager = Modular.get<RequestCore>();

  Future<List<Establishment>> getListShops() async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName:
          "/api/establishment/findAll?status=APROVADO&direction=DESC&orderBy=createdAt&size=100&page=0",
      body: {},
      isObject: false,
      funcFromMap: (data) => Establishment.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
    return ObjectUtils.parseToObjectList<Establishment>(
        result.content ?? <Establishment>[]);
  }

  Future<List<Category>> getListCategory() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Category(description: 'Comida', image: ImagePath.food),
      Category(description: 'Bebida', image: ImagePath.drink),
      Category(description: 'Doces', image: ImagePath.candies),
      Category(description: 'Carnes', image: ImagePath.meats),
      Category(description: 'Padaria', image: ImagePath.bakery),
      Category(description: 'Congelados', image: ImagePath.freezes),
    ];
  }

  Future<List<Category>> getListType() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Category(description: 'RESTAURANTES', image: ImagePath.restaurant),
      Category(description: 'LANCHONETES', image: ImagePath.lanch),
      Category(description: 'SUPERMERCADO', image: ImagePath.supermarket),
      Category(description: 'MERCADOS', image: ImagePath.market),
      Category(description: 'BEBIDAS', image: ImagePath.drink),
      Category(description: 'FARMACIA', image: ImagePath.pharmacy),
    ];
  }

  Future<List<Product>> getListProduct(String id,
      {int page = 0, int size = 200}) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName:
          "/api/product/findAllByEstablishment?id=$id&page=$page&size=$size",
      body: {},
      isObject: false,
      funcFromMap: (data) => Product.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
    return ObjectUtils.parseToObjectList<Product>(
        result.content ?? <Product>[]);
  }

  Future<Establishment> getCurrentShopByID(String idShops) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/findById?id=$idShops",
      body: {},
      isObject: true,
      funcFromMap: (data) => Establishment.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
    return result.content;
  }
}
