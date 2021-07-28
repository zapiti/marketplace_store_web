import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/core/request_core.dart';
import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/object/object_utils.dart';

class MyStoreRepository {
  final _requestManager = Modular.get<RequestCore>();

  Future<List<Product>> getListStore() async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: '/api/product/findAllByEstablishmentLogged',
      body: {},
      funcFromMap: (data) => Product.fromMap(data),
      isObject: false,
      typeRequest: TYPEREQUEST.GET,
    );

    return ObjectUtils.parseToObjectList<Product>(result.content ?? <Product>[]) ;
  }

  Future<ResponsePaginated> createOrUpdateProduct(Product product) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: '/api/product',
      body: product.toMap(),
      funcFromMap: (data) => data,
      isObject: true,
      typeRequest: product.id != null ? TYPEREQUEST.PUT : TYPEREQUEST.POST,
    );
    return result;
  }
}
