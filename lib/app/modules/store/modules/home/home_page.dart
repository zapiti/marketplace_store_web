import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/page/page_web.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/home_store.dart';
import 'package:new_marketplace_web/app/modules/store/modules/home/widget/home_page_options.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';

import '../../store_store.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeStore> {
  final storeControl = Modular.get<StoreStore>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      controller.selectPage(controller.ANDAMENTO);
      storeControl.getCurrentEstablishment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageWeb(
        child: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Observer(
                  builder: (_) => Container(

                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.monetization_on,
                                            color: Colors.white,
                                          ),
                                          Expanded(
                                              child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: AutoSizeText(
                                                    "Sua receita",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    minFontSize: 6,
                                                    style: AppThemeUtils
                                                        .normalSize(
                                                            color: AppThemeUtils
                                                                .whiteColor,
                                                            fontSize: 10),
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: AutoSizeText(
                                                    Utils.moneyMasked(
                                                        storeControl.establishment?.wallet ?? 0.0),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    minFontSize: 6,
                                                    style: AppThemeUtils
                                                        .normalBoldSize(
                                                            color: AppThemeUtils
                                                                .whiteColor,
                                                            fontSize: 14),
                                                  ))
                                            ],
                                          ))
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: AppThemeUtils.successColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              side: BorderSide(
                                                  color:
                                                      AppThemeUtils.whiteColor,
                                                  width: 1))),
                                    ))),
                            Expanded(
                                child: Container(
                                    height: 50,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller
                                            .selectPage(controller.ANDAMENTO);
                                      },
                                      child: Text(
                                        "Em andamento",
                                        style: AppThemeUtils.normalBoldSize(
                                            color: controller.actualPage ==
                                                    controller.ANDAMENTO
                                                ? AppThemeUtils.whiteColor
                                                : AppThemeUtils.colorPrimary,
                                            fontSize: 14),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: controller.actualPage ==
                                                  controller.ANDAMENTO
                                              ? AppThemeUtils.colorPrimary
                                              : AppThemeUtils.whiteColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10)),
                                              side: BorderSide(
                                                  color: AppThemeUtils
                                                      .colorPrimary,
                                                  width: 1))),
                                    ))),
                            Expanded(
                                child: Container(
                                    height: 50,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller
                                            .selectPage(controller.ANTERIOR);
                                      },
                                      child: Text(
                                        "Anteriores",
                                        style: AppThemeUtils.normalBoldSize(
                                            color: controller.actualPage ==
                                                    controller.ANTERIOR
                                                ? AppThemeUtils.whiteColor
                                                : AppThemeUtils.colorPrimary,
                                            fontSize: 14),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: controller.actualPage ==
                                                  controller.ANTERIOR
                                              ? AppThemeUtils.colorPrimary
                                              : AppThemeUtils.whiteColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              side: BorderSide(
                                                  color: AppThemeUtils
                                                      .colorPrimary,
                                                  width: 1))),
                                    )))
                          ],
                        ),
                      )),
            ),
          ),
          Expanded(
              child: Container(
            child: Center(
              child: Container(

                child: HomePageOptions(controller),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
