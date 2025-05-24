
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/modules/client/modules/home/page/home/initial_home_page.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';


import 'home_store.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InitialHomePage(),
    );
  }
}
