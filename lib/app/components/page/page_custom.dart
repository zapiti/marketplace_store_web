import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/appbar/custom_app_bar.dart';
import 'package:marketplace_store_web/app/components/drawer/custom_drawer.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class PageCustom extends StatelessWidget {
  final Widget body;

  PageCustom({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ""),
      drawer: Utils.isSmalSize(
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width))
          ? null
          : CustomDrawer(),
      body: body,
    );
  }
}
