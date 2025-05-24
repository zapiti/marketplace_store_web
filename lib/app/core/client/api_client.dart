import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/configuration/app_configuration.dart';
import 'package:new_marketplace_web/app/modules/login/repository/auth_repository.dart';

import '../../app_store.dart';

class ApiClient {
  var _dio = Modular.get<Dio>();
  var _authToken = Modular.get<AuthRepository>();
  var appStore = Modular.get<AppStore>();

  ///Configura a otilizacao da api para fazer requisicao
  Future<Dio> getApiClient() async {
    var user = await _authToken.getToken();
    var baseUrl = (AppConfiguration.baseUrl());
    try {
      _dio.interceptors.clear();
      _dio.options.baseUrl = baseUrl;
      print("Url=> $baseUrl");

      _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        var header = getHeaderToken(token: user);
        options.headers = header;

        options.connectTimeout = 50 * 1000; // 60 seconds
        options.receiveTimeout = 50 * 1000; // 60 seconds
        return handler.next(options); //continue
      }, onResponse: (response, handler) {
        return handler.next(response); // continue
      }, onError: (DioError e, handler) {
        return handler.next(e); //continue
      }));
    } catch (e) {}
    return _dio;
  }

  static Map<String, String> getHeaderToken({String? token}) {
    if (token == null) {
      return <String, String>{
        'content-Type': 'application/json',
        'accept': 'application/json',
      };
    } else {
      return <String, String>{
        'content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
  }
}
