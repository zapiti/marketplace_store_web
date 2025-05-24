// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreStore on _StoreStoreBase, Store {
  late final _$currentIndexAtom =
      Atom(name: '_StoreStoreBase.currentIndex', context: context);

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

  late final _$establishmentAtom =
      Atom(name: '_StoreStoreBase.establishment', context: context);

  @override
  Establishment? get establishment {
    _$establishmentAtom.reportRead();
    return super.establishment;
  }

  @override
  set establishment(Establishment? value) {
    _$establishmentAtom.reportWrite(value, super.establishment, () {
      super.establishment = value;
    });
  }

  late final _$getCurrentEstablishmentAsyncAction =
      AsyncAction('_StoreStoreBase.getCurrentEstablishment', context: context);

  @override
  Future getCurrentEstablishment() {
    return _$getCurrentEstablishmentAsyncAction
        .run(() => super.getCurrentEstablishment());
  }

  late final _$updateEstablishmentAsyncAction =
      AsyncAction('_StoreStoreBase.updateEstablishment', context: context);

  @override
  Future updateEstablishment(BuildContext context, Establishment _establishment,
      {bool onlyStab = false}) {
    return _$updateEstablishmentAsyncAction.run(() =>
        super.updateEstablishment(context, _establishment, onlyStab: onlyStab));
  }

  late final _$_StoreStoreBaseActionController =
      ActionController(name: '_StoreStoreBase', context: context);

  @override
  dynamic updateEstablishmentLocal(Establishment _establishment) {
    final _$actionInfo = _$_StoreStoreBaseActionController.startAction(
        name: '_StoreStoreBase.updateEstablishmentLocal');
    try {
      return super.updateEstablishmentLocal(_establishment);
    } finally {
      _$_StoreStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
currentIndex: ${currentIndex},
establishment: ${establishment}
    ''';
  }
}
