import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';


class ItemProductEdit extends StatefulWidget {
  final Product product;

  ItemProductEdit(this.product);

  @override
  _ItemProductEditState createState() => _ItemProductEditState();
}

class _ItemProductEditState extends State<ItemProductEdit> {
  final MyStoreStore controller = Modular.get<MyStoreStore>();

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
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      MoneyMaskedTextController(
                              decimalSeparator: '.',
                              thousandSeparator: ',',
                              leftSymbol: "R\$ ",
                              initialValue: widget.product.value ?? 0.0)
                          .text,
                      style: AppThemeUtils.normalBoldSize(
                          color: AppThemeUtils.successColor, fontSize: 18),
                    ),
                  )
                ],
              )),
              Container(
                  height: 130,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 20),
                        child: Center(
                            child: ImageWidgetComponent(
                          widget.product.image ?? '',
                          height: 180,
                          fit: BoxFit.cover,
                          width: 150,
                        )),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 150,
                          height: 200,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                decoration: new BoxDecoration(
                                  color: AppThemeUtils.colorPrimary,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                    color: AppThemeUtils.colorPrimary,
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: AppThemeUtils.whiteColor,
                                    ),
                                    onPressed: () {
                                      controller.updateCurrentProduct(widget.product);
                                      Modular.to.pushNamed(ConstantsRoutes
                                          .CALL_ALTER_PRODUCT_STORE_PAGE);
                                    })),
                          ))
                    ],
                  ))
            ],
          ),
        ),
        lineViewWidget()
      ],
    );
  }
}
