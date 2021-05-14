// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  final _$isLoadLoginAtom = Atom(name: '_RegisterStoreBase.isLoadLogin');

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

  final _$actualPageAtom = Atom(name: '_RegisterStoreBase.actualPage');

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

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  void selectPage(String page) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.selectPage');
    try {
      return super.selectPage(page);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getRegister(BuildContext context) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.getRegister');
    try {
      return super.getRegister(context);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadLogin: ${isLoadLogin},
actualPage: ${actualPage}
    ''';
  }
}
