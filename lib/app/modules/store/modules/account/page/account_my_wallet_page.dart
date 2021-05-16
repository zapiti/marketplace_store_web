import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/divider/line_view_widget.dart';
import 'package:marketplace_store_web/app/components/mobile/title_descritption_web_widget.dart';
import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';

class AccountMyWalletPage extends StatefulWidget {
  @override
  AccountMyWalletPageState createState() => AccountMyWalletPageState();
}

class AccountMyWalletPageState extends State<AccountMyWalletPage> {
  @override
  Widget build(BuildContext context) {
    return PageWeb(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 30, bottom: 20),
                          child: Text(
                            "Minha carteira",
                            style: AppThemeUtils.normalBoldSize(
                                color: AppThemeUtils.colorPrimary,
                                fontSize: 24),
                          )),

                    ],
                  )
    );
  }
}
