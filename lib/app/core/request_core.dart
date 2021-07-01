import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:marketplace_store_web/app/components/load/dialog_loading.dart';
import 'package:marketplace_store_web/app/models/code_response.dart';
import 'package:marketplace_store_web/app/models/page/response_paginated.dart';
import 'package:marketplace_store_web/app/utils/response/request_utils.dart';

import 'client/api_client.dart';

enum TYPEREQUEST { PATCH, POST, PUT, GET, DELETE }

class RequestCore {
  static const TYPE_GET = "GET";
  static const TYPE_POST = "POST";
  static const TYPE_PUT = "PUT";
  static const showBody = true;

  ///@serviceName e o nome do servico chamado
  ///@funcFromMap e conversao da sua funcao para algo que voce quer
  ///@body e o corpo da requisicao
  ///@typeRequest  e o tipo da requisicao
  ///@namedResponse e se a requisicao tem um nome
  ///@isImage e caso o enviado seja multpartFile
  ///isJsonResponse e caso nao precise dar parce no body pra json
  Future<ResponsePaginated> requestWithTokenToForm(
      {required serviceName,
      required funcFromMap,
      dynamic body,
      required TYPEREQUEST typeRequest,
       String? namedResponse,
      bool isImage = false,
      bool isJsonResponse = true,
      bool isLoad = false,
      bool isObject = true,
      String? url,
      String app = "backoffice-api"}) async {
    var api = await ApiClient().getApiClient();
    try {
      debugPrint(
          "SERVICOCHAMADO (${typeRequest.toString()})= $serviceName body = ${jsonEncode(body ?? {})}");
    } catch (e) {}

    try {
      if (isLoad) {
        showLoading(true);
      }

      final result = await requestMyApp(typeRequest, api, serviceName,
          isJsonResponse, isImage, body, funcFromMap, namedResponse, isObject);
      if (isLoad) {
        showLoading(false);
      }
      return result;
    } on DioError catch (e) {
      if (isLoad) {
        showLoading(false);
      }
      print(
          "***RETORNO-SERVICO (Erro)(${typeRequest.toString()}) = $serviceName body = ${showBody ? e.response ?? e : {}}");

      if (e.response?.statusCode == 403) {}
      var msg = ResponseUtils.getErrorBody(e.response?.data);
      return ResponseUtils.getResponsePaginatedObject(
          CodeResponse(error: msg), funcFromMap,
          status: e.response?.statusCode);
    } on Exception catch (e) {
      if (isLoad) {
        showLoading(false);
      }
      var msg =
          ResponseUtils.getErrorBody(e.toString()) ?? "Sem descrição de erro";
      return ResponseUtils.getResponsePaginatedObject(
          CodeResponse(error: msg), funcFromMap,
          status: 500);
    }
  }

  Future<ResponsePaginated> requestMyApp(
      TYPEREQUEST typeRequest,
      Dio api,
      serviceName,
      bool isJsonResponse,
      bool isImage,
      body,
      funcFromMap,
      namedResponse,
      bool isObject) async {
    Response response;

    switch (typeRequest) {
      case TYPEREQUEST.GET:
        response = await api.get(
          serviceName,
          options: Options(
            contentType: "application/json;charset=UTF-8",
          ),
        );
        break;
      case TYPEREQUEST.POST:
        response = await api.post(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;

      case TYPEREQUEST.PUT:
        response = await api.put(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;

      case TYPEREQUEST.PATCH:
        response = await api.patch(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;
      case TYPEREQUEST.DELETE:
        response = await api.delete(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;
      default:
        response = await api.post(
          serviceName,
          data: isJsonResponse
              ? isImage
                  ? body
                  : jsonEncode(body ?? {})
              : body,
          options: Options(
            contentType: isImage
                ? 'multipart/form-data'
                : "application/json;charset=UTF-8",
          ),
        );
        break;
    }

    var statusCode = response.statusCode;
    print("Current status code: $statusCode");

    print(
        "##RETORNO-SERVICO(${typeRequest.toString()}) = $serviceName body = ${showBody ? response : {}}");
    if (statusCode == 200 ||
        statusCode == 201 ||
        statusCode == 202 ||
        statusCode == 203 ||
        statusCode == 204) {
      return ResponseUtils.getResponsePaginatedObject(
          CodeResponse(sucess: response.data), funcFromMap,
          namedResponse: namedResponse,
          isObject: isObject,
          status: response.statusCode);

      // return tryAgainElement(typeRequest, api, serviceName, isJsonResponse, isImage, body, funcFromMap, namedResponse, isObject);

    } else {
      return ResponseUtils.getResponsePaginatedObject(
          CodeResponse(error: response), funcFromMap,
          status: response.statusCode);
    }
  }
}
