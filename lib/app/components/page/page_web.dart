import 'package:flutter/material.dart';

class PageWeb extends StatelessWidget {
  final Widget child;

  PageWeb({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Container(
                width: 500,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(child: child))));
  }
}
