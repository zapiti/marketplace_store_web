// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$listProductCartAtom = Atom(name: '_CartStoreBase.listProductCart');

  @override
  List<Product> get listProductCart {
    _$listProductCartAtom.reportRead();
    return super.listProductCart;
  }

  @override
  set listProductCart(List<Product> value) {
    _$listProductCartAtom.reportWrite(value, super.listProductCart, () {
      super.listProductCart = value;
    });
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  dynamic getTempList() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.getTempList');
    try {
      return super.getTempList();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCart(Product product) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.updateCart');
    try {
      return super.updateCart(product);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProductCart: ${listProductCart}
    ''';
  }
}
