


import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/core/request_core.dart';
import 'package:new_marketplace_web/app/models/page/response_paginated.dart';


class AccountClientRepository {
  var _requestManager = Modular.get<RequestCore>();



  Future<ResponsePaginated> sendHelp(String text) async {
    final result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/client/help",
      isObject: true,
      body: {"message": text},
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    return result;
  }

  updatePass(String text) async {
    final result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/client-user/changePassword?password=$text",
      isObject: true,
      body: {},
      funcFromMap: (data) => data,
      typeRequest:  TYPEREQUEST.PUT ,
    );
    return result;
  }
}