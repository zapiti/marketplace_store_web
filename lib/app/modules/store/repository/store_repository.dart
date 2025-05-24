import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/core/request_core.dart';
import 'package:new_marketplace_web/app/models/current_user.dart';

class StoreRepository {
  final _requestManager = Modular.get<RequestCore>();

  Future<Establishment> getCurrentEstablishment() async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: '/api/establishment/findLogged',
      body: {},
      funcFromMap: (data) => Establishment.fromMap(data),
      isObject: true,
      typeRequest: TYPEREQUEST.GET,
    );
    return result.content;
  }

  Future updateEstablishment(Establishment establishment) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: '/api/establishment',
      body: establishment.toCreate(),
      funcFromMap: (data) => data,
      isObject: true,
      typeRequest: TYPEREQUEST.PUT,
    );
    return result;
  }

 Future updateOpeningHours(Establishment establishment) async {
    var result = await _requestManager.requestWithTokenToForm(
      serviceName: '/api/establishment/operation/manage',
      body: establishment.toOppeningHours(),
      funcFromMap: (data) => data,
      isObject: true,
      typeRequest: TYPEREQUEST.PUT,
    );
    return result;
  }
}
