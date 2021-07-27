

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/core/request_core.dart';
import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/modules/store/model/mystore.dart';

class RegisterRepository {
  var _requestManager = Modular.get<RequestCore>();
  Future<ResponsePaginated>  createNewStore(MyStore store) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName:
      "/api/establishment",
      body: store.toMap(),
      isObject: true,
      isLoad: true,
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    return result;
  }
}