// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_store_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyStoreStore on _MyStoreStoreBase, Store {
  final _$imageUserAtom = Atom(name: '_MyStoreStoreBase.imageUser');

  @override
  String get imageUser {
    _$imageUserAtom.reportRead();
    return super.imageUser;
  }

  @override
  set imageUser(String value) {
    _$imageUserAtom.reportWrite(value, super.imageUser, () {
      super.imageUser = value;
    });
  }

  final _$imageBackgroundAtom = Atom(name: '_MyStoreStoreBase.imageBackground');

  @override
  String get imageBackground {
    _$imageBackgroundAtom.reportRead();
    return super.imageBackground;
  }

  @override
  set imageBackground(String value) {
    _$imageBackgroundAtom.reportWrite(value, super.imageBackground, () {
      super.imageBackground = value;
    });
  }

  final _$imageTempProductAtom =
      Atom(name: '_MyStoreStoreBase.imageTempProduct');

  @override
  String get imageTempProduct {
    _$imageTempProductAtom.reportRead();
    return super.imageTempProduct;
  }

  @override
  set imageTempProduct(String value) {
    _$imageTempProductAtom.reportWrite(value, super.imageTempProduct, () {
      super.imageTempProduct = value;
    });
  }

  final _$nomeLocalAtom = Atom(name: '_MyStoreStoreBase.nomeLocal');

  @override
  String get nomeLocal {
    _$nomeLocalAtom.reportRead();
    return super.nomeLocal;
  }

  @override
  set nomeLocal(String value) {
    _$nomeLocalAtom.reportWrite(value, super.nomeLocal, () {
      super.nomeLocal = value;
    });
  }

  final _$horarioFuncionamentoAtom =
      Atom(name: '_MyStoreStoreBase.horarioFuncionamento');

  @override
  String get horarioFuncionamento {
    _$horarioFuncionamentoAtom.reportRead();
    return super.horarioFuncionamento;
  }

  @override
  set horarioFuncionamento(String value) {
    _$horarioFuncionamentoAtom.reportWrite(value, super.horarioFuncionamento,
        () {
      super.horarioFuncionamento = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_MyStoreStoreBase.telefone');

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$tempoPreparoAtom = Atom(name: '_MyStoreStoreBase.tempoPreparo');

  @override
  String get tempoPreparo {
    _$tempoPreparoAtom.reportRead();
    return super.tempoPreparo;
  }

  @override
  set tempoPreparo(String value) {
    _$tempoPreparoAtom.reportWrite(value, super.tempoPreparo, () {
      super.tempoPreparo = value;
    });
  }

  final _$actualPageAtom = Atom(name: '_MyStoreStoreBase.actualPage');

  @override
  String get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(String value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  final _$actualProductPageAtom =
      Atom(name: '_MyStoreStoreBase.actualProductPage');

  @override
  String get actualProductPage {
    _$actualProductPageAtom.reportRead();
    return super.actualProductPage;
  }

  @override
  set actualProductPage(String value) {
    _$actualProductPageAtom.reportWrite(value, super.actualProductPage, () {
      super.actualProductPage = value;
    });
  }

  final _$listProductsAtom = Atom(name: '_MyStoreStoreBase.listProducts');

  @override
  List<Product>? get listProducts {
    _$listProductsAtom.reportRead();
    return super.listProducts;
  }

  @override
  set listProducts(List<Product>? value) {
    _$listProductsAtom.reportWrite(value, super.listProducts, () {
      super.listProducts = value;
    });
  }

  final _$_MyStoreStoreBaseActionController =
      ActionController(name: '_MyStoreStoreBase');

  @override
  void selectedPage(String myPage) {
    final _$actionInfo = _$_MyStoreStoreBaseActionController.startAction(
        name: '_MyStoreStoreBase.selectedPage');
    try {
      return super.selectedPage(myPage);
    } finally {
      _$_MyStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedProductPage(String myPage) {
    final _$actionInfo = _$_MyStoreStoreBaseActionController.startAction(
        name: '_MyStoreStoreBase.selectedProductPage');
    try {
      return super.selectedProductPage(myPage);
    } finally {
      _$_MyStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getListStore() {
    final _$actionInfo = _$_MyStoreStoreBaseActionController.startAction(
        name: '_MyStoreStoreBase.getListStore');
    try {
      return super.getListStore();
    } finally {
      _$_MyStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextToQuantity(BuildContext context) {
    final _$actionInfo = _$_MyStoreStoreBaseActionController.startAction(
        name: '_MyStoreStoreBase.nextToQuantity');
    try {
      return super.nextToQuantity(context);
    } finally {
      _$_MyStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextToQrcode(BuildContext context) {
    final _$actionInfo = _$_MyStoreStoreBaseActionController.startAction(
        name: '_MyStoreStoreBase.nextToQrcode');
    try {
      return super.nextToQrcode(context);
    } finally {
      _$_MyStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveProduct(BuildContext context) {
    final _$actionInfo = _$_MyStoreStoreBaseActionController.startAction(
        name: '_MyStoreStoreBase.saveProduct');
    try {
      return super.saveProduct(context);
    } finally {
      _$_MyStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageUser: ${imageUser},
imageBackground: ${imageBackground},
imageTempProduct: ${imageTempProduct},
nomeLocal: ${nomeLocal},
horarioFuncionamento: ${horarioFuncionamento},
telefone: ${telefone},
tempoPreparo: ${tempoPreparo},
actualPage: ${actualPage},
actualProductPage: ${actualProductPage},
listProducts: ${listProducts}
    ''';
  }
}
