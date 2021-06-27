import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/dialog/dialog_generic.dart';
import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/repository/my_store_repository.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:mobx/mobx.dart';

part 'my_store_store.g.dart';

class MyStoreStore = _MyStoreStoreBase with _$MyStoreStore;

abstract class _MyStoreStoreBase with Store {
  final String MYTEMPO = "MYTEMPO";
  final String TELEFONE = "TELEFONE";
  final String HORARIO = "HORARIO";
  final String CODIGO_DE_BARRAS = "CODIGO_DE_BARRAS";
  final String QUANTIDADE = "QUANTIDADE";
  final String SOBRE = "SOBRE";

  final descrProductController = TextEditingController();

  final setorProductController = TextEditingController();

  final categoryController = TextEditingController();

  final valuePromotionController = MoneyMaskedTextController(leftSymbol: "R\$");

  final valueProductController = MoneyMaskedTextController(leftSymbol: "R\$");

  final nomeProductController = TextEditingController();

  var quantityProductController = TextEditingController();
  final _repository = Modular.get<MyStoreRepository>();

  @observable
  String imageUser =
      "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  @observable
  String imageBackground =
      "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  @observable
  String imageTempProduct =
      "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  @observable
  String nomeLocal = "Mercearia Gonzaga";

  @observable
  String horarioFuncionamento = "10h às 18h";

  @observable
  String telefone = "(34) 99828-4812";

  @observable
  String tempoPreparo = "40 min";

  @observable
  String actualPage = "HORARIO";

  @observable
  String actualProductPage = "SOBRE";

  @observable
  List<Product>? listProducts;

  @action
  void selectedPage(String myPage) {
    actualPage = myPage;
  }

  @action
  void selectedProductPage(String myPage) {
    actualProductPage = myPage;
  }

  @action
  void getListStore() {
    listProducts = null;

    _repository.getListStore().then((value) {
      listProducts = value;
    });
  }

  @action
  void nextToQuantity(BuildContext context) {
    selectedProductPage(QUANTIDADE);
  }

  @action
  void nextToQrcode(BuildContext context) {
    selectedProductPage(CODIGO_DE_BARRAS);
  }

  @action
  void saveProduct(BuildContext context) {
    Modular.to.pushReplacementNamed(ConstantsRoutes.CALL_MY_STORE);
  }

  void saveProductToDigite(BuildContext context) {
    final controller = TextEditingController();

    showGenericDialog(
        context: context,
        title: "Digite o código",
        description: "",
        positiveText: "Confirmar",
        containsPop: true,
        positiveCallback: () {
          Modular.to.pushReplacementNamed(ConstantsRoutes.CALL_MY_STORE);
        },
        negativeText: "Cancelar",
        negativeCallback: () {},
        iconData: Icons.error_outline,
        customWidget: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[200],
            child: CupertinoTextField(
              placeholder: "Código do produto",
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: BoxDecoration(),
              style: AppThemeUtils.normalSize(color: AppThemeUtils.black),
            ),
          ),
        ));
  }

  void saveProductToCode(BuildContext context) {
    Modular.to.pushReplacementNamed(ConstantsRoutes.CALL_MY_STORE);
  }
}
