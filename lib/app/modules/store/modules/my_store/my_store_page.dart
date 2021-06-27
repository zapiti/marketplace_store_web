import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/components/picker/user_image_widget.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/my_store_store.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/widget/my_store_main_page.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class MyStorePage extends StatefulWidget {
  @override
  MyStorePageState createState() => MyStorePageState();
}

class MyStorePageState extends ModularState<MyStorePage, MyStoreStore> {
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
          child:Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: UserImageWidget(
                              changeImage: (txt) {},
                              width: MediaQuery.of(context).size.width,
                              height: 160,
                              addButtom: "Alterar capa",
                              isRounded: false,
                              userImage: controller.imageBackground,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 100, right: 20, left: 20),
                                child: UserImageWidget(
                                  changeImage: (txt) {},
                                  userImage: controller.imageUser,
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 140, right: 0, left: 0),
                                    child: Text(
                                      controller.nomeLocal,
                                      style: AppThemeUtils.normalBoldSize(
                                          fontSize: 18),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 0, right: 0, left: 0),
                                      child: Text(
                                        "Editar loja",
                                        style: AppThemeUtils.normalSize(
                                            fontSize: 14,
                                            color: AppThemeUtils.colorPrimary),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Container(

                          margin: EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: ElevatedButton(
                            child: Text(
                              "+ Adicionar produto ",
                              style: AppThemeUtils.normalSize(
                                  color: AppThemeUtils.colorPrimary,
                                  fontSize: 14),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: AppThemeUtils.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(4.0),
                                    side: BorderSide(
                                        color: AppThemeUtils.colorPrimary))),
                            onPressed: () {
                              Modular.to.pushNamed(ConstantsRoutes.CALL_ALTER_PRODUCT_STORE_PAGE);
                            },
                          )),
                      Expanded(child: MyStoreMainPage(controller))
                    ],
                  )),
    );
  }
}
