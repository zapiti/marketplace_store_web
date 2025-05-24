// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_store_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyStoreStore on _MyStoreStoreBase, Store {
  late final _$currentProductAtom =
      Atom(name: '_MyStoreStoreBase.currentProduct', context: context);

  @override
  Product get currentProduct {
    _$currentProductAtom.reportRead();
    return super.currentProduct;
  }

  @override
  set currentProduct(Product value) {
    _$currentProductAtom.reportWrite(value, super.currentProduct, () {
      super.currentProduct = value;
    });
  }

  late final _$actualPageAtom =
      Atom(name: '_MyStoreStoreBase.actualPage', context: context);

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

  late final _$actualProductPageAtom =
      Atom(name: '_MyStoreStoreBase.actualProductPage', context: context);

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

  late final _$listProductsAtom =
      Atom(name: '_MyStoreStoreBase.listProducts', context: context);

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

  late final _$saveProductAsyncAction =
      AsyncAction('_MyStoreStoreBase.saveProduct', context: context);

  @override
  Future<void> saveProduct(BuildContext context) {
    return _$saveProductAsyncAction.run(() => super.saveProduct(context));
  }

  late final _$_MyStoreStoreBaseActionController =
      ActionController(name: '_MyStoreStoreBase', context: context);

  @override
  void updateCurrentProduct(Product product) {
    final _$actionInfo = _$_MyStoreStoreBaseActionController.startAction(
        name: '_MyStoreStoreBase.updateCurrentProduct');
    try {
      return super.updateCurrentProduct(product);
    } finally {
      _$_MyStoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
currentProduct: ${currentProduct},
actualPage: ${actualPage},
actualProductPage: ${actualProductPage},
listProducts: ${listProducts}
    ''';
  }
}
