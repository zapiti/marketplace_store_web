import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_marketplace_web/app/components/dialog/dialog_generic.dart';
import 'package:new_marketplace_web/app/models/current_user.dart';
import 'package:new_marketplace_web/app/modules/login/login_store.dart';
import 'package:new_marketplace_web/app/modules/register/repository/register_repository.dart';
import 'package:new_marketplace_web/app/modules/store/model/mystore.dart';
import 'package:new_marketplace_web/app/routes/constants_routes.dart';
import 'package:new_marketplace_web/app/utils/utils.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final PEDIDO = "PEDIDO";
  final PRODUTO = "PRODUTO";
  final ENTREGADOR = "ENTREGADOR";

  final modelController = TextEditingController();
  final cnpjController = TextEditingController();
  final cityController = TextEditingController();
  final passControllerConfirm = TextEditingController();
  final passController = TextEditingController();
  final nameUserController = TextEditingController();
  final emailController = TextEditingController();

  final _repository = Modular.get<RegisterRepository>();

  @observable
  bool isLoadLogin = false;

  @observable
  bool showHidePassConfirm = true;

  @observable
  bool showHidePass = true;

  @observable
  bool term = false;

  @observable
  String? actualPage;

  @action
  changeTerm() {
    term = !term;
  }

  @action
  void showHideConfirmIcon() {
    showHidePassConfirm = !showHidePassConfirm;
  }

  @action
  void showHideIcon() {
    showHidePass = !showHidePass;
  }

  @action
  void selectPage(String page) {
    actualPage = page;
  }

  @action
  Future<void> register() async {
    isLoadLogin = true;
    try {
      // TODO: Implement register logic
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      print(e);
    } finally {
      isLoadLogin = false;
    }
  }

  @action
  Future<void> getRegister(BuildContext context) async {
    isLoadLogin = true;
    final response = await _repository.createClient(
      name: nameUserController.text,
      email: emailController.text,
      password: passControllerConfirm.text,
    );
    isLoadLogin = false;
    if (response.error != null) {
      Utils.showSnackBar(response.error, context);
    } else {
      DialogGeneric.showGenericDialog(
        context: context,
        title: 'Salvo com sucesso',
        description: "Tudo pronto agora você já pode fazer seu pedido",
        positiveText: 'OK',
        positiveCallback: () {
          final loginController = Modular.get<LoginStore>();
          loginController.userController.text = emailController.text;
          loginController.passController.text = passController.text;
          loginController.getLoginClient(context);
        },
      );
    }
  }

  @action
  getRegisterProduct(BuildContext context, MyStore myStore) async {
    isLoadLogin = true;
    final response = await _repository.createNewStore(myStore);
    isLoadLogin = false;
    if (response.error != null) {
      Utils.showSnackBar(response.error, context);
    } else {
      DialogGeneric.showGenericDialog(
        context: context,
        title: 'Salvo com sucesso',
        description:
            "Tudo pronto agora só aguardar a aprovação no seu e-mail para ativação da sua conta",
        positiveText: 'OK',
        positiveCallback: () {
          Modular.to.pushReplacementNamed(ConstantsRoutes.LANDING);
        },
      );
    }
  }

  @override
  void dispose() {
    nameUserController.dispose();
    emailController.dispose();
    passController.dispose();
    passControllerConfirm.dispose();
  }
}
