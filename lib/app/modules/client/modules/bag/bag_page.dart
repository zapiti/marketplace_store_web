import 'package:flutter/material.dart';

import 'package:new_marketplace_web/app/components/page/page_web.dart';
import 'package:new_marketplace_web/app/modules/client/modules/bag/widget/bag_page_options.dart';

class BagPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWeb(
          child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Center(
              child: Container(
                child: BagPageOptions(),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
