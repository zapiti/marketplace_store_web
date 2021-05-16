import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/mobile/title_descritption_web_widget.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageWeb(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 30, bottom: 20),
                          child: Text(
                            "Sua conta",
                            style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.colorPrimary,
                                fontSize: 24),
                          )),
                      TitleDescriptionWebWidget(
                        title: "Alterar senha",
                        action: () {
                          Modular.to.pushNamed(ConstantsRoutes.CALL_ALTERPASS);
                        },
                        iconData: MaterialCommunityIcons.lock_outline,
                      ),
                      lineViewWidget(),
                      TitleDescriptionWebWidget(
                        title: "Minha carteira",
                        action: () {
                          Modular.to.pushNamed(ConstantsRoutes.CALL_WALLET);
                        },
                        iconData: MaterialCommunityIcons.cash_usd,
                      ),
                      lineViewWidget(),
                      TitleDescriptionWebWidget(
                        title: "Ajuda",
                        action: () {
                          Modular.to.pushNamed(ConstantsRoutes.CALL_HELP);
                        },
                        iconData: MaterialCommunityIcons.information_outline,
                      ),
                      lineViewWidget(),
                      TitleDescriptionWebWidget(
                        title: "Sair",
                        action: () {},
                        iconData: MaterialCommunityIcons.exit_to_app,
                      ),
                      lineViewWidget(),
                    ],
                  ))
    );
  }
}
