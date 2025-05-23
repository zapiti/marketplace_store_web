// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStore on _OrderStoreBase, Store {
  late final _$listOrderAtom =
      Atom(name: '_OrderStoreBase.listOrder', context: context);

  @override
  List<Order>? get listOrder {
    _$listOrderAtom.reportRead();
    return super.listOrder;
  }

  @override
  set listOrder(List<Order>? value) {
    _$listOrderAtom.reportWrite(value, super.listOrder, () {
      super.listOrder = value;
    });
  }

  late final _$currentOrderAtom =
      Atom(name: '_OrderStoreBase.currentOrder', context: context);

  @override
  Order? get currentOrder {
    _$currentOrderAtom.reportRead();
    return super.currentOrder;
  }

  @override
  set currentOrder(Order? value) {
    _$currentOrderAtom.reportWrite(value, super.currentOrder, () {
      super.currentOrder = value;
    });
  }

  late final _$getListOrderAsyncAction =
      AsyncAction('_OrderStoreBase.getListOrder', context: context);

  @override
  Future getListOrder() {
    return _$getListOrderAsyncAction.run(() => super.getListOrder());
  }

  late final _$_OrderStoreBaseActionController =
      ActionController(name: '_OrderStoreBase', context: context);

  @override
  void setCurrentOrder(Order order) {
    final _$actionInfo = _$_OrderStoreBaseActionController.startAction(
        name: '_OrderStoreBase.setCurrentOrder');
    try {
      return super.setCurrentOrder(order);
    } finally {
      _$_OrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listOrder: ${listOrder},
currentOrder: ${currentOrder}
    ''';
  }
}
