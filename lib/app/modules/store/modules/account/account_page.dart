import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:new_marketplace_web/app/components/divider/line_view_widget.dart';
import 'package:new_marketplace_web/app/components/mobile/title_descritption_web_widget.dart';
import 'package:new_marketplace_web/app/components/page/page_web.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/theme/app_theme_utils.dart';

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
                          Modular.to.pushNamed(ConstantsRoutes.CALL_STORE_ALTERPASS);
                        },
                        iconData: FontAwesomeIcons.lock,
                      ),
                      lineViewWidget(),
                      TitleDescriptionWebWidget(
                        title: "Minha carteira",
                        action: () {
                          Modular.to.pushNamed(ConstantsRoutes.CALL_WALLET);
                        },
                        iconData: FontAwesomeIcons.wallet,
                      ),
                      lineViewWidget(),
                      TitleDescriptionWebWidget(
                        title: "Ajuda",
                        action: () {
                          Modular.to.pushNamed(ConstantsRoutes.CALL_STORE_HELP);
                        },
                        iconData: FontAwesomeIcons.question,
                      ),
                      lineViewWidget(),
                      TitleDescriptionWebWidget(
                        title: "Sair",
                        action: () {
                          
                          Modular.to.pushReplacementNamed(ConstantsRoutes.LOGIN);
                        },
                        iconData: Icons.exit_to_app,
                      ),
                      lineViewWidget(),
                    ],
                  ))
    );
  }
}
