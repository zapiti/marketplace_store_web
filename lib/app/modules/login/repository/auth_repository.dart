import 'dart:async';
import 'dart:convert';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/core/request_core.dart';
import 'package:marketplace_store_web/app/models/current_user.dart';
import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/preferences/local_storage.dart';


import '../../../app_store.dart';

class AuthRepository {
  static const SERVICELOGIN = "/api/adm/auth/login";
  var _requestManager = Modular.get<RequestCore>();

  Future<ResponsePaginated> getLogin({String username, String password}) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: SERVICELOGIN,
      body: {"username": username, "password": password},
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    if (result.error == null) {
      if (result.content.toString().contains("access_token")) {
        var token = result.content["access_token"];
        var current = CurrentUser.fromMap(Jwt.parseJwt(token));
        var appStore = Modular.get<AppStore>();
        appStore.setCurrentUser(current);
        _setToken(token);
      }
    }

    return result;
  }

  Future<String> _setToken(String token) async {
    return await LocalDataStore.setData(key: CurrentUser.USERLOG, value: token);
  }


  Future<String> getToken() async {
    var user = await LocalDataStore.getValue(key: CurrentUser.USERLOG);
    if (user == null) {
      return null;
    } else {
      return user;
    }
  }

  Future<ResponsePaginated> getLogout() async {
    LocalDataStore.deleteAll();
      Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
    return ResponsePaginated();
  }

  Future<void> setToken(CurrentUser currentUser) async {
    var user = currentUser?.toMap();
    return await LocalDataStore.setData(
        key: CurrentUser.USERLOG, value: jsonEncode(user));
  }
}
