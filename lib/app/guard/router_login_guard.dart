
import 'package:flutter_modular/flutter_modular.dart';


class RouterLoginGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {

    return true;
  }

  @override
  String get guardedRoute => "";
}