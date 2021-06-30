// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  final _$orderAtom = Atom(name: '_CartStoreBase.order');

  @override
  Order get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(Order value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  final _$getTempListAsyncAction = AsyncAction('_CartStoreBase.getTempList');

  @override
  Future getTempList() {
    return _$getTempListAsyncAction.run(() => super.getTempList());
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

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
order: ${order}
    ''';
  }
}
