import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/core/request_core.dart';
import 'package:new_marketplace_web/app/models/current_user.dart';
import 'package:new_marketplace_web/app/models/page/response_paginated.dart';
import 'package:new_marketplace_web/app/modules/store/model/mystore.dart';

class RegisterRepository {
  var _requestManager = Modular.get<RequestCore>();

  Future<ResponsePaginated> createNewStore(MyStore store) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment",
      body: store.toMap(),
      isObject: true,
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    return result;
  }

  Future<ResponsePaginated> createClient({
      required String name, required String email, required String password}) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/client",
      body: {"name": name, "email": email, "password": password},
      isObject: true,
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    return result;
  }
}
