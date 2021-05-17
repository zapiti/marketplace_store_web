import 'package:flutter/material.dart';

class PageWeb extends StatelessWidget {
  final Widget child;

  PageWeb({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(15),
        child: Center(
            child: Container(
                width: 530,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(child: child))));
  }
}
