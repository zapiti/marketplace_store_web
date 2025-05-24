import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/empty/empty_view.dart';
import 'package:new_marketplace_web/app/components/load/load_elements.dart';

class LoadBuilder extends StatelessWidget {
  final dynamic item;

  final String? emptyImage;
  final String? message;
  final Widget child;

  LoadBuilder({this.item, required this.child,  this.emptyImage,  this.message});

  @override
  Widget build(BuildContext context) {
    return item == null
        ? loadElements(size: 50)
        : !(item is List) ? child:item.isEmpty
            ? EmptyViewMobile(emptyMessage: message)
            : child;
  }
}
