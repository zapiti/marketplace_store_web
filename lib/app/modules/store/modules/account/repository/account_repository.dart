import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/core/request_core.dart';
import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/modules/store/modules/account/model/account_info.dart';
import 'package:marketplace_store_web/app/modules/store/modules/account/model/wallet_data.dart';

class AccountRepository {
  var _requestManager = Modular.get<RequestCore>();

  Future<WalletData?> getWalletInfo({int page = 0}) async {
    final result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/getWallet",
      isObject: true,
      funcFromMap: (data) => WalletData.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
    return result.content;
  }

  Future<AccountInfo?> getAccountInfo({int page = 0}) async {
    final result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/account/findByLoggedUser",
      isObject: true,
      funcFromMap: (data) => AccountInfo.fromMap(data),
      typeRequest: TYPEREQUEST.GET,
    );
    return result.content;
  }

  Future<ResponsePaginated> createOrUpdateAccount(
      AccountInfo accountInfo) async {
    final result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/account",
      isObject: true,
      body: accountInfo.toMap(),
      funcFromMap: (data) => data,
      typeRequest: accountInfo.id != null ? TYPEREQUEST.PUT : TYPEREQUEST.POST,
    );
    return result;
  }

  Future<ResponsePaginated> sendHelp(String text) async {
    final result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/help",
      isObject: true,
      body: {"message": text},
      funcFromMap: (data) => data,
      typeRequest: TYPEREQUEST.POST,
    );
    return result;
  }

  updatePass(String text) async {
    final result = await _requestManager.requestWithTokenToForm(
      serviceName: "/api/establishment/user/changePassword?password=$text",
      isObject: true,
      body: {},
      funcFromMap: (data) => data,
      typeRequest:  TYPEREQUEST.PUT ,
    );
    return result;
  }
}
