
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/load/load_elements.dart';
import 'package:new_marketplace_web/app/modules/register/pages/register_entregador_page.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

import '../login_store.dart';

class LoginEntregadorPage  extends StatefulWidget {
  @override
  _LoginEntregadorPageState createState() => _LoginEntregadorPageState();
}

class _LoginEntregadorPageState extends ModularState<LoginEntregadorPage, LoginStore>  {
  @override
  Widget build(BuildContext context) {
    return RegisterEntregadorPage();
  }
}
