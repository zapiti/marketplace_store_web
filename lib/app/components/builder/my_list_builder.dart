import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/empty/empty_view.dart';
import 'package:new_marketplace_web/app/components/load/load_elements.dart';

class MyListBuilder extends StatelessWidget {
  final Axis? scrollDirection;
  final List? list;
  final Function(BuildContext, int)itemBuilder;
  final String? emptyImage;
  final String? message;

  MyListBuilder(
      {this.scrollDirection,
      this.list,
      required this.itemBuilder,
      this.emptyImage,
      this.message});

  @override
  Widget build(BuildContext context) {
    return list == null
        ? loadElements()
        : list!.isEmpty
            ? EmptyViewMobile(emptyMessage: message)
            : ListView.builder(
                scrollDirection: scrollDirection ?? Axis.vertical,
                itemCount: list!.length,
                itemBuilder: (context, index) => itemBuilder(context, index));
  }
}
