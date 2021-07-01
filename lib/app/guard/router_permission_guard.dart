import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/app_store.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';


class RouterPermissionGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    final _appStore = Modular.get<AppStore>();
    final value = await _appStore.getCurrentUserFutureValue();
    if(value == null){
      return false;
    }else {
      if(path.contains(ConstantsRoutes.CLIENTROUTE) && value.client == null){
        return false;
      }else if (path.contains(ConstantsRoutes.STOREROUTE) && value.establishment == null){
        return false;
      }else {
        return true;
      }
    }

  }

  @override
  String get guardedRoute => "/";
}
