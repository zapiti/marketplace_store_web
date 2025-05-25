import 'dart:async';
import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/core/request_core.dart';
import 'package:new_marketplace_web/app/models/current_user.dart';
import 'package:new_marketplace_web/app/models/page/response_paginated.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/preferences/local_storage.dart';

import '../../../app_store.dart';

class AuthRepository {
  static const SERVICELOGINSTAB = "/api/estab/auth/login";
  static const SERVICELOGINCLIENT = "/api/client/auth/login";
  var _requestManager = Modular.get<RequestCore>();

  Future<ResponsePaginated> getLogin(
      {required String username,
      required String password,
      required bool isClient}) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: isClient ? SERVICELOGINCLIENT : SERVICELOGINSTAB,
      body: {"username": username, "password": password},
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );

    if (result.error == null) {
      if (result.content.toString().contains("access_token")) {
        var userData = result.content["user"];
        var current = CurrentUser.fromMap(userData);
        var appStore = Modular.get<AppStore>();
        appStore.setCurrentUser(current);
        await _setToken(result.content["access_token"]);
      }
    }

    return result;
  }

  Future<void> _setToken(String token) async {
    await LocalDataStore.setData(key: CurrentUser.USERLOG, value: token);
  }

  Future<String?> getToken() async {
    try {
      return await LocalDataStore.getValue(key: CurrentUser.USERLOG);
    } catch (e) {
      return null;
    }
  }

  Future<ResponsePaginated> getLogout() async {
    await LocalDataStore.deleteAll();
    Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
    return ResponsePaginated();
  }

  Future<void> setToken(CurrentUser currentUser) async {
    var user = currentUser.toMap();
    await LocalDataStore.setData(
        key: CurrentUser.USERLOG, value: jsonEncode(user));
  }
}
