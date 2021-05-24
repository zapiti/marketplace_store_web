import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/builder/load_builder.dart';

import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/home_store.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/page/store/widget/store_page_options.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';

import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

class DetailStorePage extends StatefulWidget {
  final String idShops;
  final Product product;

  DetailStorePage(this.idShops, this.product);

  @override
  _DetailStorePageState createState() => _DetailStorePageState();
}

class _DetailStorePageState extends ModularState<DetailStorePage, HomeStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.getListCurrentStore(widget.idShops);
      controller.setCurrentProduct(widget.product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWeb(
          child: Observer(
              builder: (_) => Column(
                    children: [
                      Stack(
                        children: [
                          LoadBuilder(
                              item: controller.currentShops,
                              child: Container(
                                child: UserImageWidget(
                                  changeImage: (txt) {},
                                  enable: false,
                                  width: MediaQuery.of(context).size.width,
                                  height: 160,
                                  isRounded: false,
                                  userImage:
                                      controller.currentShops?.imageBackground,
                                ),
                              )),
                          LoadBuilder(
                              item: controller.currentShops,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 130, right: 20, left: 20),
                                        child: UserImageWidget(
                                          changeImage: (txt) {},
                                          enable: false,
                                          userImage:
                                              controller.currentShops?.image ??
                                                  "",
                                        ),
                                      ),
                                      Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 140, right: 0, left: 0),
                                            child: Text(
                                              controller.currentShops?.name ??
                                                  "teste",
                                              style:
                                                  AppThemeUtils.normalBoldSize(
                                                      fontSize: 18),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 0),
                                            child: AutoSizeText(
                                              "Loja - ${controller.currentShops?.distanceKm}km",
                                              maxLines: 1,
                                              minFontSize: 8,
                                              style: AppThemeUtils.normalSize(),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 0, vertical: 0),
                                                child: AutoSizeText(
                                                  Utils.moneyMasked(controller
                                                      .currentShops
                                                      ?.valueDelivery),
                                                  maxLines: 1,
                                                  minFontSize: 8,
                                                  style: AppThemeUtils
                                                      .normalBoldSize(
                                                          color: AppThemeUtils
                                                              .successColor),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 0, vertical: 0),
                                                child: AutoSizeText(
                                                  "  30-40min",
                                                  maxLines: 1,
                                                  minFontSize: 8,
                                                  style: AppThemeUtils
                                                      .normalSize(),
                                                ),
                                              ))
                                            ],
                                          )
                                        ],
                                      ))
                                    ],
                                  )))
                        ],
                      ),
                      Expanded(
                          child: Container(
                        child: StorePageOptions(controller),
                      ))
                    ],
                  ))),
    );
  }
}
