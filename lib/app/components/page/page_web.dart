import 'package:flutter/material.dart';

class PageWeb extends StatelessWidget {
  final Widget child;

  PageWeb({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(15),
        child: Center(
            child: Container(
                width: 1200,
                height: MediaQuery.of(context).size.height,
                child:  child)));
  }
}
