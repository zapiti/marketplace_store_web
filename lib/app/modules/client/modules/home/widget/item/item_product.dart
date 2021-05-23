import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/model/category.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class ItemProduct extends StatelessWidget {
  final Product product;

  ItemProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Card(
              child: InkWell(
                  onTap: () {},
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(product.imageUrl),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: AutoSizeText(
                          product.name,
                          maxLines: 2,
                          minFontSize: 8,
                          style: AppThemeUtils.normalBoldSize(),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: AutoSizeText(
                          MoneyMaskedTextController(
                                  initialValue: product.valor,
                                  leftSymbol: "R\$")
                              .text,
                          maxLines: 1,
                          minFontSize: 8,
                          style: AppThemeUtils.normalBoldSize(
                              color: AppThemeUtils.successColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )))),
        ],
      ),
    );
  }
}
