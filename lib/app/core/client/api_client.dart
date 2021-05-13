

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/configuration/app_configuration.dart';
import 'package:marketplace_store_web/app/core/auth/auth_repository.dart';



class ApiClient {
  var _dio = Modular.get<Dio>();
  var _authToken = Modular.get<AuthRepository>();
  var appBloc = Modular.get<AppStore>();

  ///Configura a otilizacao da api para fazer requisicao
  Future<Dio> getApiClient() async {
    var user = await _authToken.getToken();
    var baseUrl = await AppConfiguration.baseUrl();
    try {
    _dio.interceptors.clear();

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options,_) {
      // Do something before request is sent
      var header = getHeaderToken(token: user?.token);
      options.headers = header;
      options.baseUrl = baseUrl;
      options.connectTimeout = 50 * 1000; // 60 seconds
      options.receiveTimeout = 50 * 1000; // 60 seconds

      print("Url=> $baseUrl");
      return options;
    }, onResponse: (Response response,_) {
      return response; // continue
    }, onError: (DioError error,_) async {
      // Do something with response error
      if (error?.response?.statusCode == 403 ) {
        _dio.interceptors.requestLock.lock();
        _dio.interceptors.responseLock.lock();
        print("refresh token");
        // final refreshToken = await appBloc.getCurrentUserFutureValue();
        // RequestOptions options = error.response.request;
        // var header = getHeaderToken(token: refreshToken?.token);

        // var url = await AppConfiguration.baseUrl();
        // final response = await http.get(url + "user/token/refresh", headers: {
        //   'Authorization': 'Bearer ${refreshToken?.token}'
        // }).timeout(Duration(seconds: 15));
        // var responseData = response?.body != null && response?.body != ""
        //     ? jsonDecode(response?.body)
        //     : {};
        // var statusCode = response?.statusCode;
        // _dio.interceptors.responseLock.unlock();
        // _dio.interceptors.requestLock.unlock();
        // if (statusCode == 200) {
        //   appBloc.setTokenUser(responseData["token"]);
        //   // appBloc.setRefreshTokenUser(responseData["refresh_token"]);
        //
        //   var headers = getHeaderToken(token: responseData["token"]);
        //
        //   options.headers.clear();
        //   options.headers = headers;
        // } else {
        //  // Modular.get<LoginBloc>().getLogout();
        //   return error;
        // }

        _dio.interceptors.responseLock.unlock();
        _dio.interceptors.requestLock.unlock();
        return error;
      } else {
        return error;
      }
    }));
  } catch (e) {}
    return _dio;
  }

  static Map<String, String> getHeaderToken({String token}) {
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
