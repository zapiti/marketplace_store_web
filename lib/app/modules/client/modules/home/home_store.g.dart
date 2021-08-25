// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$listCategoryAtom = Atom(name: '_HomeStoreBase.listCategory');

  @override
  List<Category>? get listCategory {
    _$listCategoryAtom.reportRead();
    return super.listCategory;
  }

  @override
  set listCategory(List<Category>? value) {
    _$listCategoryAtom.reportWrite(value, super.listCategory, () {
      super.listCategory = value;
    });
  }

  final _$listTypeAtom = Atom(name: '_HomeStoreBase.listType');

  @override
  List<Category>? get listType {
    _$listTypeAtom.reportRead();
    return super.listType;
  }

  @override
  set listType(List<Category>? value) {
    _$listTypeAtom.reportWrite(value, super.listType, () {
      super.listType = value;
    });
  }

  final _$listProductAtom = Atom(name: '_HomeStoreBase.listProduct');

  @override
  List<Product>? get listProduct {
    _$listProductAtom.reportRead();
    return super.listProduct;
  }

  @override
  set listProduct(List<Product>? value) {
    _$listProductAtom.reportWrite(value, super.listProduct, () {
      super.listProduct = value;
    });
  }

  final _$listPromoAtom = Atom(name: '_HomeStoreBase.listPromo');

  @override
  List<Product>? get listPromo {
    _$listPromoAtom.reportRead();
    return super.listPromo;
  }

  @override
  set listPromo(List<Product>? value) {
    _$listPromoAtom.reportWrite(value, super.listPromo, () {
      super.listPromo = value;
    });
  }

  final _$listShopsAtom = Atom(name: '_HomeStoreBase.listShops');

  @override
  List<Establishment>? get listShops {
    _$listShopsAtom.reportRead();
    return super.listShops;
  }

  @override
  set listShops(List<Establishment>? value) {
    _$listShopsAtom.reportWrite(value, super.listShops, () {
      super.listShops = value;
    });
  }

  final _$bannerAtom = Atom(name: '_HomeStoreBase.banner');

  @override
  MyBanner? get banner {
    _$bannerAtom.reportRead();
    return super.banner;
  }

  @override
  set banner(MyBanner? value) {
    _$bannerAtom.reportWrite(value, super.banner, () {
      super.banner = value;
    });
  }

  final _$currentShopsAtom = Atom(name: '_HomeStoreBase.currentShops');

  @override
  Establishment? get currentShops {
    _$currentShopsAtom.reportRead();
    return super.currentShops;
  }

  @override
  set currentShops(Establishment? value) {
    _$currentShopsAtom.reportWrite(value, super.currentShops, () {
      super.currentShops = value;
    });
  }

  final _$selectedProductAtom = Atom(name: '_HomeStoreBase.selectedProduct');

  @override
  Product? get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(Product? value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  final _$getCurrentAddressAsyncAction =
      AsyncAction('_HomeStoreBase.getCurrentAddress');

  @override
  Future getCurrentAddress() {
    return _$getCurrentAddressAsyncAction.run(() => super.getCurrentAddress());
  }

  final _$getListShopsAsyncAction = AsyncAction('_HomeStoreBase.getListShops');

  @override
  Future getListShops() {
    return _$getListShopsAsyncAction.run(() => super.getListShops());
  }

  final _$getListCategoryAsyncAction =
      AsyncAction('_HomeStoreBase.getListCategory');

  @override
  Future getListCategory() {
    return _$getListCategoryAsyncAction.run(() => super.getListCategory());
  }

  final _$getListTypeAsyncAction = AsyncAction('_HomeStoreBase.getListType');

  @override
  Future getListType() {
    return _$getListTypeAsyncAction.run(() => super.getListType());
  }

  final _$getListProductAsyncAction =
      AsyncAction('_HomeStoreBase.getListProduct');

  @override
  Future getListProduct(String? idShopping) {
    return _$getListProductAsyncAction
        .run(() => super.getListProduct(idShopping));
  }

  final _$getCurrentShopByIDAsyncAction =
      AsyncAction('_HomeStoreBase.getCurrentShopByID');

  @override
  Future getCurrentShopByID(String? idShopping) {
    return _$getCurrentShopByIDAsyncAction
        .run(() => super.getCurrentShopByID(idShopping));
  }

  final _$setCurrentShopsAsyncAction =
      AsyncAction('_HomeStoreBase.setCurrentShops');

  @override
  Future setCurrentShops(Establishment? myCurrentShop) {
    return _$setCurrentShopsAsyncAction
        .run(() => super.setCurrentShops(myCurrentShop));
  }

  final _$setCurrentProductAsyncAction =
      AsyncAction('_HomeStoreBase.setCurrentProduct');

  @override
  Future setCurrentProduct(Product? myCurrentProduct) {
    return _$setCurrentProductAsyncAction
        .run(() => super.setCurrentProduct(myCurrentProduct));
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic getBanner() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.getBanner');
    try {
      return super.getBanner();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCategory: ${listCategory},
listType: ${listType},
listProduct: ${listProduct},
listPromo: ${listPromo},
listShops: ${listShops},
banner: ${banner},
currentShops: ${currentShops},
selectedProduct: ${selectedProduct}
    ''';
  }
}
