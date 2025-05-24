import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/dialog/dialog_generic.dart';
import 'package:new_marketplace_web/app/modules/store/modules/account/repository/account_repository.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

import 'model/account_info.dart';
import 'model/wallet_data.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStoreBase with _$AccountStore;

abstract class _AccountStoreBase with Store {
  final _repository = Modular.get<AccountRepository>();

  final controllerHelp = TextEditingController();

  final controllerPass = TextEditingController();

  final controllerPassActualPass = TextEditingController();

  final controllerPassConfirm = TextEditingController();

  @observable
  WalletData? walletData;

  @observable
  bool showPassActual = false;

  @observable
  bool showPass = false;

  @observable
  bool showPassConfirm = false;

  @observable
  AccountInfo accountInfo = AccountInfo();

  @action
  Future<void> getListWalletTransition() async {
    walletData = await _repository.getWalletInfo();
  }

  @action
  Future<void> getAccountInfo() async {
    final result = await _repository.getAccountInfo();
    accountInfo = result ?? AccountInfo();
  }

  @action
  hideActualPass() {
    showPassActual = !showPassActual;
  }

  @action
  hidePass() {
    showPass = !showPass;
  }

  @action
  hidePassConfirm() {
    showPassConfirm = !showPassConfirm;
  }

  @action
  Future<void> changePass(BuildContext context) async {
    if (controllerPassActualPass.text == controllerPass.text) {
      Utils.showSnackBar('Senha nova é igual a anterior', context);
    } else if (controllerPassConfirm.text != controllerPass.text) {
      Utils.showSnackBar('Senhas não são iguais', context);
    } else {
      final response = await _repository.updatePass(controllerPass.text);

      if (response.error != null) {
        Utils.showSnackBar(response.error, context);
      } else {
        controllerPassActualPass.clear();
        controllerPass.clear();
        controllerPassConfirm.clear();
        Utils.showSnackBar('Senha alterada com sucesso', context);
      }
    }
  }

  @action
  Future<void> updateAccount(
      BuildContext context, AccountInfo _accountInfo) async {
    final response = await _repository.createOrUpdateAccount(_accountInfo);

    if (response.error != null) {
      Utils.showSnackBar(response.error, context);
    } else {
      accountInfo = _accountInfo;
      Utils.showSnackBar('Salvo com sucesso', context);
    }
  }

  Future<void> sendHelp(BuildContext context) async {
    final response = await _repository.sendHelp(controllerHelp.text);

    if (response.error != null) {
      Utils.showSnackBar(response.error, context);
    } else {
      controllerHelp.clear();
      showGenericDialog(
          context: context,
          title: 'Salvo com sucesso',
          description:
              "Sua dúvida foi enviada com sucesso logo retornaremos com sua resposta por email",
          positiveText: 'OK',
          positiveCallback: () {
            Modular.to.navigate(ConstantsRoutes.CALL_ACCOUNT_STORE_PAGE);
          });
    }
  }
}
