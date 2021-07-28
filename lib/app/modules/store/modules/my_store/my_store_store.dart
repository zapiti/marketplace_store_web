import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marketplace_store_web/app/components/dialog/dialog_generic.dart';

import 'package:marketplace_store_web/app/modules/store/model/product.dart';
import 'package:marketplace_store_web/app/modules/store/modules/my_store/repository/my_store_repository.dart';
import 'package:marketplace_store_web/app/routes/constants_routes.dart';
import 'package:marketplace_store_web/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_web/app/utils/utils.dart';
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

  final _repository = Modular.get<MyStoreRepository>();

  @observable
  Product currentProduct = Product();

  @observable
  String actualPage = "HORARIO";

  @observable
  String actualProductPage = "SOBRE";

  @observable
  List<Product>? listProducts;

  @action
  void updateCurrentProduct(Product product) {
    currentProduct = product;
  }

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
  Future<void> saveProduct(BuildContext context) async {
    final product = currentProduct;
    final response = await _repository.createOrUpdateProduct(product);

    if (response.error != null) {
      Utils.showSnackBar(response.error, context);
    } else {
      currentProduct = product;
      Utils.showSnackBar('salvo com sucesso', context);
      Modular.to.pushReplacementNamed(ConstantsRoutes.CALL_MY_STORE);
    }
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
          currentProduct.barCode = controller.text;
          saveProduct(context);
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
