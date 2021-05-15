// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreStore on _StoreStoreBase, Store {
  final _$currentIndexAtom = Atom(name: '_StoreStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_StoreStoreBaseActionController =
      ActionController(name: '_StoreStoreBase');

  @override
  dynamic addCurrentIndex(int index) {
    final _$actionInfo = _$_StoreStoreBaseActionController.startAction(
        name: '_StoreStoreBase.addCurrentIndex');
    try {
      return super.addCurrentIndex(index);
    } finally {
      _$_StoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
