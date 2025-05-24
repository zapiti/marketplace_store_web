// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$listCategoryAtom =
      Atom(name: '_HomeStoreBase.listCategory', context: context);

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

  late final _$listTypeAtom =
      Atom(name: '_HomeStoreBase.listType', context: context);

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

  late final _$listProductAtom =
      Atom(name: '_HomeStoreBase.listProduct', context: context);

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

  late final _$listPromoAtom =
      Atom(name: '_HomeStoreBase.listPromo', context: context);

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

  late final _$listShopsAtom =
      Atom(name: '_HomeStoreBase.listShops', context: context);

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

  late final _$bannerAtom =
      Atom(name: '_HomeStoreBase.banner', context: context);

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

  late final _$currentShopsAtom =
      Atom(name: '_HomeStoreBase.currentShops', context: context);

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

  late final _$selectedProductAtom =
      Atom(name: '_HomeStoreBase.selectedProduct', context: context);

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

  late final _$getCurrentAddressAsyncAction =
      AsyncAction('_HomeStoreBase.getCurrentAddress', context: context);

  @override
  Future getCurrentAddress() {
    return _$getCurrentAddressAsyncAction.run(() => super.getCurrentAddress());
  }

  late final _$getListShopsAsyncAction =
      AsyncAction('_HomeStoreBase.getListShops', context: context);

  @override
  Future getListShops() {
    return _$getListShopsAsyncAction.run(() => super.getListShops());
  }

  late final _$getListCategoryAsyncAction =
      AsyncAction('_HomeStoreBase.getListCategory', context: context);

  @override
  Future getListCategory() {
    return _$getListCategoryAsyncAction.run(() => super.getListCategory());
  }

  late final _$getListTypeAsyncAction =
      AsyncAction('_HomeStoreBase.getListType', context: context);

  @override
  Future getListType() {
    return _$getListTypeAsyncAction.run(() => super.getListType());
  }

  late final _$getListProductAsyncAction =
      AsyncAction('_HomeStoreBase.getListProduct', context: context);

  @override
  Future getListProduct(String? idShopping) {
    return _$getListProductAsyncAction
        .run(() => super.getListProduct(idShopping));
  }

  late final _$getCurrentShopByIDAsyncAction =
      AsyncAction('_HomeStoreBase.getCurrentShopByID', context: context);

  @override
  Future getCurrentShopByID(String? idShopping) {
    return _$getCurrentShopByIDAsyncAction
        .run(() => super.getCurrentShopByID(idShopping));
  }

  late final _$setCurrentShopsAsyncAction =
      AsyncAction('_HomeStoreBase.setCurrentShops', context: context);

  @override
  Future setCurrentShops(Establishment? myCurrentShop) {
    return _$setCurrentShopsAsyncAction
        .run(() => super.setCurrentShops(myCurrentShop));
  }

  late final _$setCurrentProductAsyncAction =
      AsyncAction('_HomeStoreBase.setCurrentProduct', context: context);

  @override
  Future setCurrentProduct(Product? myCurrentProduct) {
    return _$setCurrentProductAsyncAction
        .run(() => super.setCurrentProduct(myCurrentProduct));
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

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
