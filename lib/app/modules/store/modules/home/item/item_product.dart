import 'package:flutter/material.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class ItemProduct extends StatefulWidget {
  final Product product;

  ItemProduct(this.product);

  @override
  _ItemProductState createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.product.name ?? '',
                      style: AppThemeUtils.normalBoldSize(),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.product.description ?? '',
                      style: AppThemeUtils.normalSize(fontSize: 12),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.product.quantityType ?? '',
                      style: AppThemeUtils.normalBoldSize(
                          color: AppThemeUtils.black),
                    ),
                  )
                ],
              )),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: ImageWidgetComponent(
                  widget.product.image ?? '',
                  width: 150,
                ),
              )
            ],
          ),
        ),
        lineViewWidget()
      ],
    );
  }
}
