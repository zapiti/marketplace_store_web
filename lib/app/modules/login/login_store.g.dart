// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$showHidePassAtom = Atom(name: '_LoginStoreBase.showHidePass');

  @override
  bool get showHidePass {
    _$showHidePassAtom.reportRead();
    return super.showHidePass;
  }

  @override
  set showHidePass(bool value) {
    _$showHidePassAtom.reportWrite(value, super.showHidePass, () {
      super.showHidePass = value;
    });
  }

  final _$isLoadLoginAtom = Atom(name: '_LoginStoreBase.isLoadLogin');

  @override
  bool get isLoadLogin {
    _$isLoadLoginAtom.reportRead();
    return super.isLoadLogin;
  }

  @override
  set isLoadLogin(bool value) {
    _$isLoadLoginAtom.reportWrite(value, super.isLoadLogin, () {
      super.isLoadLogin = value;
    });
  }

  final _$actualPageAtom = Atom(name: '_LoginStoreBase.actualPage');

  @override
  String get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(String value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void showHideIcon() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.showHideIcon');
    try {
      return super.showHideIcon();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showLoad() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.showLoad');
    try {
      return super.showLoad();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideLoad() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.hideLoad');
    try {
      return super.hideLoad();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPage(String page) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.selectPage');
    try {
      return super.selectPage(page);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showHidePass: ${showHidePass},
isLoadLogin: ${isLoadLogin},
actualPage: ${actualPage}
    ''';
  }
}
