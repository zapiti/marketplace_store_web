import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';
import 'package:marketplace_store_web/app/components/load/load_elements.dart';

class MyListBuilder extends StatelessWidget {
  final Axis scrollDirection;
  final List list;
  final Function(BuildContext, int) itemBuilder;
  final String emptyImage;
  final String message;

  MyListBuilder(
      {this.scrollDirection,
      this.list,
      this.itemBuilder,
      this.emptyImage,
      this.message});

  @override
  Widget build(BuildContext context) {
    return list == null
        ? loadElements()
        : list.isEmpty
            ? EmptyView(emptyImage, message)
            : ListView.builder(
                scrollDirection: scrollDirection,
                itemCount: list.length,
                itemBuilder: (context, index) => itemBuilder(context, index));
  }
}
