// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BagStore on _BagStoreBase, Store {
  Computed<int>? _$processIndexComputed;

  @override
  int get processIndex =>
      (_$processIndexComputed ??= Computed<int>(() => super.processIndex,
              name: '_BagStoreBase.processIndex'))
          .value;

  final _$_processIndexAtom = Atom(name: '_BagStoreBase._processIndex');

  @override
  int get _processIndex {
    _$_processIndexAtom.reportRead();
    return super._processIndex;
  }

  @override
  set _processIndex(int value) {
    _$_processIndexAtom.reportWrite(value, super._processIndex, () {
      super._processIndex = value;
    });
  }

  final _$actualPageBagAtom = Atom(name: '_BagStoreBase.actualPageBag');

  @override
  String get actualPageBag {
    _$actualPageBagAtom.reportRead();
    return super.actualPageBag;
  }

  @override
  set actualPageBag(String value) {
    _$actualPageBagAtom.reportWrite(value, super.actualPageBag, () {
      super.actualPageBag = value;
    });
  }

  final _$_BagStoreBaseActionController =
      ActionController(name: '_BagStoreBase');

  @override
  void goNextProgress(int? index) {
    final _$actionInfo = _$_BagStoreBaseActionController.startAction(
        name: '_BagStoreBase.goNextProgress');
    try {
      return super.goNextProgress(index);
    } finally {
      _$_BagStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualPageBag: ${actualPageBag},
processIndex: ${processIndex}
    ''';
  }
}
