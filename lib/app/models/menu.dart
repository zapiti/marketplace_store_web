import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:marketplace_store_web/app/models/current_user.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';


class Menu {
  String title;
  IconData icon;
  String route;
  String menuTitle;
  bool hide;

  Menu({this.title, this.icon, this.route, this.menuTitle, this.hide});

  static List<Menu> getListWithPermission(CurrentUser currentUser) {
    return _meusMenus.toList();
  }
}

final List<Menu> _meusMenus = [
  Menu(
      title: ConstantsRoutes.getNameByRoute(ConstantsRoutes.STOREROUTE),
      icon: MaterialCommunityIcons.information,
      route: ConstantsRoutes.STOREROUTE,
      hide: !kIsWeb),

];
