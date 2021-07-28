


import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/core/request_core.dart';
import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/modules/store/modules/home/model/order.dart';
import 'package:marketplace_store_web/app/utils/object/object_utils.dart';

class HomeRepository {

final _requestManager = Modular.get<RequestCore>();
 Future<List<Order>> getListOrderPending() async{
   var result = await _requestManager.requestWithTokenToForm(
     serviceName: '/api/order/findAll',
     body: {},
     funcFromMap: (data) => Order.fromMap(data),
     isObject: false,
     typeRequest: TYPEREQUEST.GET,
   );

   return ObjectUtils.parseToObjectList<Order>(result.content ?? <Order>[]) ;
  }

 Future<List<Order>> getListOrderHistory() async{
   var result = await _requestManager.requestWithTokenToForm(
     serviceName: '/api/order/findAll',
     body: {},
     funcFromMap: (data) => Order.fromMap(data),
     isObject: false,
     typeRequest: TYPEREQUEST.GET,
   );

   return ObjectUtils.parseToObjectList<Order>(result.content ?? <Order>[]) ;
 }
}