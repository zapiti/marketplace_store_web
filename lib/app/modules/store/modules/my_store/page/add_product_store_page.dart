import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/page/page_web.dart';
import 'package:new_marketplace_web/app/components/picker/user_image_widget.dart';
import 'package:new_marketplace_web/app/modules/store/modules/my_store/widget/my_store_add_product_page.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

import '../../../store_store.dart';
import '../my_store_store.dart';

class AddProductStorePage extends StatefulWidget {
  @override
  _AddProductStorePageState createState() => _AddProductStorePageState();
}

class _AddProductStorePageState
    extends ModularState<AddProductStorePage, MyStoreStore> {

  final storeControl = Modular.get<StoreStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      controller.getListStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWeb(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: UserImageWidget(
                  changeImage: (txt) {
                    storeControl.establishment?.coverImage = txt;
                    storeControl.updateEstablishment(
                        context, storeControl.establishment!,onlyStab: true);
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  addButtom: "Alterar capa",
                  isRounded: false,
                  userImage: storeControl.establishment?.coverImage,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100, right: 20, left: 20),
                    child: UserImageWidget(
                      changeImage: (txt) {
                        storeControl.establishment?.image = txt;
                        storeControl.updateEstablishment(
                            context, storeControl.establishment!,onlyStab: true);
                      },
                      userImage: storeControl.establishment?.image,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 130, right: 0, left: 0),
                        child: Text(
                          storeControl.establishment?.companyName ?? '',
                          style: AppThemeUtils.normalBoldSize(fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Expanded(child: MyStoreAddProductPage())
        ],
      )),
    );
  }
}
