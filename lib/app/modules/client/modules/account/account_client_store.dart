import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/dialog/dialog_generic.dart';
import 'package:new_marketplace_web/app/modules/client/modules/account/repository/account_client_repository.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'account_client_store.g.dart';

class AccountClientStore = _AccountClientStoreBase with _$AccountClientStore;
abstract class _AccountClientStoreBase with Store {

  final _repository = Modular.get<AccountClientRepository>();

  final controllerHelp = TextEditingController();

  final controllerPass = TextEditingController();

  final controllerPassActualPass = TextEditingController();

  final controllerPassConfirm = TextEditingController();

  @observable
  bool showPassActual = true;

  @observable
  bool showPass = true;

  @observable
  bool showPassConfirm = true;

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
            Modular.to.navigate(ConstantsRoutes.CALL_ACCOUNT_CLIENT_PAGE);
          });
    }
  }
}