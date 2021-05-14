import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/appbar/custom_app_bar.dart';
import 'package:marketplace_store_web/app/components/drawer/custom_drawer.dart';
import 'package:marketplace_store_web/app/components/page/page_custom.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
import 'package:responsive/flex_widget.dart';
import 'package:responsive/responsive_row.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return PageCustom(
        body: ListView(
      children: <Widget>[
        ResponsiveRow(
          columnsCount: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.amber,
              ),
              xs: 4,
              xsOffset: 2,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              xsLandOffset: 0,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.red,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.indigo,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.lime,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.teal,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.green,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.deepOrange,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.amber,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.grey,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.black,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.brown,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
            FlexWidget(
              child: Container(
                height: 100,
                color: Colors.cyan,
              ),
              xs: 6,
              sm: 3,
              md: 2,
              lg: 1,
              xsLand: 4,
              smLand: 2,
              mdLand: 1,
              lgLand: 1,
            ),
          ],
        )
      ],
    ));
  }
}
