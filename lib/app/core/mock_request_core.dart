import 'package:new_marketplace_web/app/core/request_core.dart';
import 'package:new_marketplace_web/app/models/page/response_paginated.dart';
import 'package:new_marketplace_web/app/models/current_user.dart';
import 'package:new_marketplace_web/app/modules/store/modules/account/model/account_info.dart';
import 'package:new_marketplace_web/app/modules/store/modules/account/model/wallet_data.dart';
import 'package:new_marketplace_web/app/modules/store/model/product.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/model/order.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/model/category.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/model/shops.dart';
import 'dart:convert';

class MockRequestCore extends RequestCore {
  @override
  Future<ResponsePaginated> requestWithTokenToForm(
      {required serviceName,
      required funcFromMap,
      dynamic body,
      required TYPEREQUEST typeRequest,
      String? namedResponse,
      bool isImage = false,
      bool isJsonResponse = true,
      bool printObject = true,
      bool isObject = true,
      String? url,
      String app = "backoffice-api"}) async {
    // Simula um pequeno delay para parecer mais real
    await Future.delayed(Duration(milliseconds: 500));

    // Mock responses based on the service name
    dynamic mockResponse;

    if (serviceName.toString().contains('/auth/login')) {
      // Login response
      final isClient = body['username'].toString().contains('@');
      final userData = {
        'id': '1',
        'name': isClient ? 'Cliente Teste' : 'Estabelecimento Teste',
        'email': body['username'],
        'type': isClient ? 'CLIENT' : 'ESTABLISHMENT',
        'status': 'ACTIVE',
        'phone': '11999999999',
        'address': 'Rua Teste, 123',
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String()
      };

      // Token simples sem JWT
      final tokenString = isClient ? 'client_token_123' : 'store_token_123';

      mockResponse = {'access_token': tokenString, 'user': userData};
    } else if (serviceName.toString().contains('/establishment/getWallet')) {
      // Wallet info
      mockResponse = {
        'balance': 1000.0,
        'transactions': [
          {
            'id': '1',
            'value': 100.0,
            'type': 'CREDIT',
            'date': DateTime.now().toIso8601String()
          },
          {
            'id': '2',
            'value': 50.0,
            'type': 'DEBIT',
            'date': DateTime.now().toIso8601String()
          }
        ]
      };
    } else if (serviceName
        .toString()
        .contains('/establishment/account/findByLoggedUser')) {
      // Account info
      mockResponse = {
        'id': '1',
        'name': 'Estabelecimento Teste',
        'email': 'estabelecimento@teste.com',
        'phone': '11999999999',
        'address': 'Rua Teste, 123',
        'status': 'ACTIVE',
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String()
      };
    } else if (serviceName.toString().contains('/establishment/findAll')) {
      // List of establishments
      mockResponse = [
        {
          'id': '1',
          'name': 'Estabelecimento 1',
          'image': 'https://via.placeholder.com/150',
          'rating': 4.5,
          'status': 'APROVADO',
          'address': 'Rua Teste, 123',
          'phone': '11999999999',
          'createdAt': DateTime.now().toIso8601String()
        },
        {
          'id': '2',
          'name': 'Estabelecimento 2',
          'image': 'https://via.placeholder.com/150',
          'rating': 4.0,
          'status': 'APROVADO',
          'address': 'Rua Teste, 456',
          'phone': '11999999998',
          'createdAt': DateTime.now().toIso8601String()
        }
      ];
    } else if (serviceName
        .toString()
        .contains('/product/findAllByEstablishment')) {
      // List of products
      mockResponse = [
        {
          'id': '1',
          'name': 'Produto 1',
          'price': 10.0,
          'description': 'Descrição do produto 1',
          'image': 'https://via.placeholder.com/150',
          'status': 'ACTIVE',
          'createdAt': DateTime.now().toIso8601String()
        },
        {
          'id': '2',
          'name': 'Produto 2',
          'price': 20.0,
          'description': 'Descrição do produto 2',
          'image': 'https://via.placeholder.com/150',
          'status': 'ACTIVE',
          'createdAt': DateTime.now().toIso8601String()
        }
      ];
    } else if (serviceName.toString().contains('/order/findAll')) {
      // List of orders
      mockResponse = [
        {
          'id': '1',
          'status': 'PENDING',
          'total': 100.0,
          'items': [
            {
              'product': {'name': 'Produto 1'},
              'quantity': 2,
              'price': 50.0
            }
          ],
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String()
        },
        {
          'id': '2',
          'status': 'COMPLETED',
          'total': 200.0,
          'items': [
            {
              'product': {'name': 'Produto 2'},
              'quantity': 1,
              'price': 200.0
            }
          ],
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String()
        }
      ];
    } else {
      // Default success response for other endpoints
      mockResponse = {
        'data': body ?? {},
        'message': 'Operação realizada com sucesso',
        'status': 200
      };
    }

    // Retorna uma resposta de sucesso
    return ResponsePaginated(
        content: funcFromMap(mockResponse),
        others: {'message': 'Operação realizada com sucesso', 'status': 200});
  }
}
