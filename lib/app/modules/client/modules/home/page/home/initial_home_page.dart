


import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/components/select/custom_drop_menu.dart';
import 'package:marketplace_store_web/app/modules/client/modules/home/widget/home_page_options.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';

import '../../home_store.dart';

class InitialHomePage extends StatefulWidget {
  @override
  _InitialHomePageState createState() => _InitialHomePageState();
}

class _InitialHomePageState extends ModularState<InitialHomePage, HomeStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageWeb(
          child: Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        Container(
                            width: 150,
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: AutoSizeText(
                                                "Seu saldo",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                minFontSize: 6,
                                                style: AppThemeUtils.normalSize(
                                                    color: AppThemeUtils.whiteColor,
                                                    fontSize: 10),
                                              )),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: AutoSizeText(
                                                Utils.moneyMasked( 0),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                minFontSize: 6,
                                                style: AppThemeUtils.normalBoldSize(
                                                    color: AppThemeUtils.whiteColor,
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
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      side: BorderSide(
                                          color: AppThemeUtils.whiteColor,
                                          width: 1))),
                            )),
                        Expanded(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40.0))),
                                child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 0),
                                    child: Row(children: [
                                      Expanded(
                                          child: Container(
                                            height: 50,
                                            child: TextField(
                                                textAlign: TextAlign.start,controller:controller. controllerAddressCurrent,
                                                textAlignVertical:
                                                TextAlignVertical.center,enabled: false,
                                                onChanged: (text) {},
                                                onSubmitted: (term) {},
                                                decoration: InputDecoration(
                                                    labelText: "Endereço",
                                                    suffixIcon:
                                                    Icon(Icons.location_on_rounded),
                                                    border:
                                                    const OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .only(
                                                          topRight: Radius
                                                              .circular(0.0),
                                                          bottomRight: Radius
                                                              .circular(0.0),
                                                          topLeft:
                                                          Radius.circular(
                                                              40.0),
                                                          bottomLeft:
                                                          Radius.circular(
                                                              40.0)),
                                                      borderSide: BorderSide(
                                                          color:
                                                          Colors.transparent,
                                                          width: 0.0),
                                                    ))),
                                          )),
                                      Expanded(
                                          child: Container(
                                              height: 50,
                                              margin:
                                              EdgeInsets.symmetric(vertical: 0),
                                              child: TextField(
                                                  textAlign: TextAlign.start,
                                                  textAlignVertical:
                                                  TextAlignVertical.center,
                                                  onChanged: (text) {},
                                                  onSubmitted: (term) {},
                                                  decoration: InputDecoration(
                                                      labelText: "Buscar",
                                                      suffixIcon:
                                                      Icon(Icons.search),
                                                      border:
                                                      const OutlineInputBorder(
                                                        borderRadius: BorderRadius
                                                            .only(
                                                            topRight: Radius
                                                                .circular(40.0),
                                                            bottomRight: Radius
                                                                .circular(40.0),
                                                            topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                            bottomLeft:
                                                            Radius.circular(
                                                                00.0)),
                                                        borderSide: BorderSide(
                                                            color:
                                                            Colors.transparent,
                                                            width: 0.0),
                                                      )))))
                                    ]))))
                      ],
                    ),
                  ),
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
