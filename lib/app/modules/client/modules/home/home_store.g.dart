// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$listCategoryAtom = Atom(name: '_HomeStoreBase.listCategory');

  @override
  List<Category> get listCategory {
    _$listCategoryAtom.reportRead();
    return super.listCategory;
  }

  @override
  set listCategory(List<Category> value) {
    _$listCategoryAtom.reportWrite(value, super.listCategory, () {
      super.listCategory = value;
    });
  }

  final _$listProductAtom = Atom(name: '_HomeStoreBase.listProduct');

  @override
  List<Product> get listProduct {
    _$listProductAtom.reportRead();
    return super.listProduct;
  }

  @override
  set listProduct(List<Product> value) {
    _$listProductAtom.reportWrite(value, super.listProduct, () {
      super.listProduct = value;
    });
  }

  final _$listPromoAtom = Atom(name: '_HomeStoreBase.listPromo');

  @override
  List<Product> get listPromo {
    _$listPromoAtom.reportRead();
    return super.listPromo;
  }

  @override
  set listPromo(List<Product> value) {
    _$listPromoAtom.reportWrite(value, super.listPromo, () {
      super.listPromo = value;
    });
  }

  final _$listShopsAtom = Atom(name: '_HomeStoreBase.listShops');

  @override
  List<Shops> get listShops {
    _$listShopsAtom.reportRead();
    return super.listShops;
  }

  @override
  set listShops(List<Shops> value) {
    _$listShopsAtom.reportWrite(value, super.listShops, () {
      super.listShops = value;
    });
  }

  final _$bannerAtom = Atom(name: '_HomeStoreBase.banner');

  @override
  MyBanner get banner {
    _$bannerAtom.reportRead();
    return super.banner;
  }

  @override
  set banner(MyBanner value) {
    _$bannerAtom.reportWrite(value, super.banner, () {
      super.banner = value;
    });
  }

  final _$currentShopsAtom = Atom(name: '_HomeStoreBase.currentShops');

  @override
  Shops get currentShops {
    _$currentShopsAtom.reportRead();
    return super.currentShops;
  }

  @override
  set currentShops(Shops value) {
    _$currentShopsAtom.reportWrite(value, super.currentShops, () {
      super.currentShops = value;
    });
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

  final _$getListProductAsyncAction =
      AsyncAction('_HomeStoreBase.getListProduct');

  @override
  Future getListProduct() {
    return _$getListProductAsyncAction.run(() => super.getListProduct());
  }

  final _$setCurrentShopsAsyncAction =
      AsyncAction('_HomeStoreBase.setCurrentShops');

  @override
  Future setCurrentShops(Shops myCurrentShop) {
    return _$setCurrentShopsAsyncAction
        .run(() => super.setCurrentShops(myCurrentShop));
  }

  final _$getListCurrentStoreAsyncAction =
      AsyncAction('_HomeStoreBase.getListCurrentStore');

  @override
  Future getListCurrentStore(String idShops) {
    return _$getListCurrentStoreAsyncAction
        .run(() => super.getListCurrentStore(idShops));
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
listProduct: ${listProduct},
listPromo: ${listPromo},
listShops: ${listShops},
banner: ${banner},
currentShops: ${currentShops}
    ''';
  }
}
