import 'package:marketplace_store_web/app/models/code_response.dart';
import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/utils/object/object_utils.dart';

class ResponseUtils {
  ///***@response e a resposta do servidor e @funcFromMap converte a resposta do servidor em algo @namedResponse e caso o servidor tenha um nome na resposta
  static List<T> getResponseList<T>(
      CodeResponse? response, Function funcFromMap) {
    if (response?.sucess == null) {
      return [];
    }
    List<T> listElementGeneric = [];
    List listContent = response?.sucess?.toList();

    for (var columns in listContent) {
      var prods = funcFromMap(columns);
      listElementGeneric.add(prods);
    }
    return listElementGeneric;
  }

  ///***@response e a resposta do servidor e @funcFromMap converte a resposta do servidor em algo @namedResponse e caso o servidor tenha um nome na resposta
  static ResponsePaginated getResponsePaginated<T>(
      CodeResponse? response, Function(Map) funcFromMap,
      {String? namedResponse, int? status}) {
    if (response?.sucess == null || response?.error != null) {
      return ResponsePaginated(
          error: response?.error ?? "Sem resposta do servidor!");
    }
    if (response?.sucess.length == 0) {
      return ResponsePaginated.fromMapSimple([]);
    }
    final responsed = (((namedResponse != null
        ? response?.sucess[namedResponse]
        : response?.sucess) as Map?) ??
        {});
    var tempResp =
    responsed.containsKey('data') ? responsed['data'] : responsed;
    List<T> listElementGeneric = [];
    List listElement = tempResp is List ? tempResp : [];

    if (listElement.isNotEmpty) {
      for (var columns in listElement) {
        var order = funcFromMap(columns);
        listElementGeneric.add(order);
      }
    }
    return ResponsePaginated.fromMapSimple(listElementGeneric);
  }

  ///***@response e a resposta do servidor e @funcFromMap converte a resposta do servidor em algo
  static ResponsePaginated getResponsePaginatedObject<T>(
      CodeResponse? response, Function(Map) funcFromMap,
      {bool isObject = true, String? namedResponse, int? status}) {
    if (!isObject) {
      return getResponsePaginated(response, funcFromMap,
          namedResponse: namedResponse, status: status);
    } else {
      if (response?.sucess == null || response?.error != null) {
        return ResponsePaginated(
            error: response?.error ?? "Sem resposta do servidor!");
      }
      final responsed = (((namedResponse != null
              ? response?.sucess[namedResponse]
              : response?.sucess) as Map?) ??
          {});
      var tempResp =
          responsed.containsKey('data') ? responsed['data'] : responsed;
      var object =
          ObjectUtils.parseToMap(tempResp, defaultValue: response?.sucess);

      return ResponsePaginated.fromMapSimple(funcFromMap(object));
    }
  }

  ///***@service e o nome do servico  @body e o body passado na requisicao  @result e o resultado do servidor
  static String? getErrorBody(dynamic result) {
    var error = ObjectUtils.parseToMap(result, defaultValue: result) ?? result;

    if (error == null) {
      return null;
    }
    if (error is Map) {
      return ((error.containsKey('data')
                  ? error['data']["error"]?.toString() ??
                      error['data']["message"]?.toString()
                  : error["message"]?.toString() ??
                      error["message"]?.toString() ??
                      error["titulo"]?.toString() ??
                      error["message"]?.toString() ??
                      error["error_description"]?.toString() ??
                      error["error"]?.toString()) ??
              "Servidor indisponível")
          .replaceAll('[', '')
          .replaceAll(']', '');
    }
    if (error?.toString().contains("html") ?? false) {
      return (error?.toString().contains("Cannot") ?? false)
          ? "Serviço não existe"
          : "Servidor indisponível";
    } else {
      return error?.toString();
    }
  }
}
