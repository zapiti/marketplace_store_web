import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/empty/empty_view.dart';

import 'package:marketplace_store_web/app/components/page/page_web.dart';
import 'package:marketplace_store_web/app/modules/client/modules/account/account_client_store.dart';
import 'package:marketplace_store_web/app/modules/store/modules/account/model/transaction.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
import 'package:simple_timeline/entity/timeline_entity.dart';
import 'package:simple_timeline/simple_timeline.dart';
import 'package:timelines/timelines.dart';

import '../account_store.dart';

class AccountMyWalletPage extends StatefulWidget {
  @override
  AccountMyWalletPageState createState() => AccountMyWalletPageState();
}

class AccountMyWalletPageState extends State<AccountMyWalletPage> {
  var enableWallet = false;
  var _accountStore = Modular.get<AccountStore>();

  @override
  void initState() {
    super.initState();
    _accountStore.getAccountInfo();
    _accountStore.getListWalletTransition();
  }

  @override
  Widget build(BuildContext context) {
    return PageWeb(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Container(
              margin: EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "Minha carteira",
                style: AppThemeUtils.normalBoldSize(
                    color: AppThemeUtils.colorPrimary, fontSize: 24),
              )),
          Container(
            child: Stack(
              children: [
                Container(
                    height: 170,
                    width: double.infinity,
                    color: !enableWallet
                        ? AppThemeUtils.darkGrey
                        : AppThemeUtils.successColor,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            Utils.moneyMasked(45),
                            style: AppThemeUtils.normalBoldSize(
                                fontSize: 28, color: AppThemeUtils.whiteColor),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Saldo atual",
                            style: AppThemeUtils.normalSize(
                                fontSize: 18, color: AppThemeUtils.whiteColor),
                          ),
                        )
                      ],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.only(top: 135, right: 30, left: 30),
                    child: ElevatedButton(
                      child: Text(
                        !enableWallet
                            ? "SAQUE DISPONÍVEL EM 7 DIAS"
                            : "SAQUE DISPONÍVEL",
                        style: AppThemeUtils.normalSize(
                            color: !enableWallet
                                ? AppThemeUtils.darkGrey
                                : AppThemeUtils.successColor),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: AppThemeUtils.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(
                                  color: !enableWallet
                                      ? AppThemeUtils.darkGrey
                                      : AppThemeUtils.successColor))),
                      onPressed: () {
                        setState(() {
                          enableWallet = !enableWallet;
                        });
                      },
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: AppThemeUtils.whiteColor,
                      ),
                      onPressed: () {
                        Modular.to.pushNamed(ConstantsRoutes.CALL_ALTERWALLET);
                      }),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                "Últimas transações",
                style: AppThemeUtils.normalBoldSize(fontSize: 18),
              )),
          (_accountStore.walletData?.transactions ?? []).isEmpty
              ? EmptyViewMobile(
                  emptyMessage: 'Você não possui transações',
                )
              : SingleChildScrollView(
                  child: SimpleTimeLine(
                      timelineList: ((_accountStore.walletData?.transactions ??
                              []))
                          .map<TimelineEntity>((e) => TimelineEntity(
                              enable: true,
                              description: e.description,
                              title: Utils.moneyMasked(e.value)))
                          .toList()))
        ]));
  }
}
