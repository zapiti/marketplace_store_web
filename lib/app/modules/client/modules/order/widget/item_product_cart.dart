import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_web/app/components/divider/line_view_widget.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/modules/store/model/product.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

class ItemProductCart extends StatelessWidget {
  final Product product;

  ItemProductCart(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
              child: Row(children: [
            Container(
                margin: EdgeInsets.all(10),
                child: ImageWidgetComponent(
                  product.image ?? '',
                  width: 80,
                  height: 80,
                )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AutoSizeText(
                    product.name ?? '',
                    maxLines: 2,
                    minFontSize: 12,
                    style: AppThemeUtils.normalBoldSize(fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AutoSizeText(
                    product.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 12,
                    style: AppThemeUtils.normalSize(fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: AutoSizeText(
                    Utils.moneyMasked(
                      product.value,
                    ),
                    maxLines: 1,
                    minFontSize: 12,
                    style: AppThemeUtils.normalBoldSize(
                        color: AppThemeUtils.successColor),
                  ),
                ),
              ],
            )),
          ])),
          lineViewWidget()
        ],
      ),
    );
  }
}
