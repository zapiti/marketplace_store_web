// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountClientStore on _AccountClientStoreBase, Store {
  late final _$showPassActualAtom =
      Atom(name: '_AccountClientStoreBase.showPassActual', context: context);

  @override
  bool get showPassActual {
    _$showPassActualAtom.reportRead();
    return super.showPassActual;
  }

  @override
  set showPassActual(bool value) {
    _$showPassActualAtom.reportWrite(value, super.showPassActual, () {
      super.showPassActual = value;
    });
  }

  late final _$showPassAtom =
      Atom(name: '_AccountClientStoreBase.showPass', context: context);

  @override
  bool get showPass {
    _$showPassAtom.reportRead();
    return super.showPass;
  }

  @override
  set showPass(bool value) {
    _$showPassAtom.reportWrite(value, super.showPass, () {
      super.showPass = value;
    });
  }

  late final _$showPassConfirmAtom =
      Atom(name: '_AccountClientStoreBase.showPassConfirm', context: context);

  @override
  bool get showPassConfirm {
    _$showPassConfirmAtom.reportRead();
    return super.showPassConfirm;
  }

  @override
  set showPassConfirm(bool value) {
    _$showPassConfirmAtom.reportWrite(value, super.showPassConfirm, () {
      super.showPassConfirm = value;
    });
  }

  late final _$changePassAsyncAction =
      AsyncAction('_AccountClientStoreBase.changePass', context: context);

  @override
  Future<void> changePass(BuildContext context) {
    return _$changePassAsyncAction.run(() => super.changePass(context));
  }

  late final _$_AccountClientStoreBaseActionController =
      ActionController(name: '_AccountClientStoreBase', context: context);

  @override
  dynamic hideActualPass() {
    final _$actionInfo = _$_AccountClientStoreBaseActionController.startAction(
        name: '_AccountClientStoreBase.hideActualPass');
    try {
      return super.hideActualPass();
    } finally {
      _$_AccountClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hidePass() {
    final _$actionInfo = _$_AccountClientStoreBaseActionController.startAction(
        name: '_AccountClientStoreBase.hidePass');
    try {
      return super.hidePass();
    } finally {
      _$_AccountClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hidePassConfirm() {
    final _$actionInfo = _$_AccountClientStoreBaseActionController.startAction(
        name: '_AccountClientStoreBase.hidePassConfirm');
    try {
      return super.hidePassConfirm();
    } finally {
      _$_AccountClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassActual: ${showPassActual},
showPass: ${showPass},
showPassConfirm: ${showPassConfirm}
    ''';
  }
}
