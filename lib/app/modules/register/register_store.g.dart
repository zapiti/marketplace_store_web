// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  late final _$isLoadLoginAtom =
      Atom(name: '_RegisterStoreBase.isLoadLogin', context: context);

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

  late final _$showHidePassConfirmAtom =
      Atom(name: '_RegisterStoreBase.showHidePassConfirm', context: context);

  @override
  bool get showHidePassConfirm {
    _$showHidePassConfirmAtom.reportRead();
    return super.showHidePassConfirm;
  }

  @override
  set showHidePassConfirm(bool value) {
    _$showHidePassConfirmAtom.reportWrite(value, super.showHidePassConfirm, () {
      super.showHidePassConfirm = value;
    });
  }

  late final _$showHidePassAtom =
      Atom(name: '_RegisterStoreBase.showHidePass', context: context);

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

  late final _$termAtom =
      Atom(name: '_RegisterStoreBase.term', context: context);

  @override
  bool get term {
    _$termAtom.reportRead();
    return super.term;
  }

  @override
  set term(bool value) {
    _$termAtom.reportWrite(value, super.term, () {
      super.term = value;
    });
  }

  late final _$actualPageAtom =
      Atom(name: '_RegisterStoreBase.actualPage', context: context);

  @override
  String? get actualPage {
    _$actualPageAtom.reportRead();
    return super.actualPage;
  }

  @override
  set actualPage(String? value) {
    _$actualPageAtom.reportWrite(value, super.actualPage, () {
      super.actualPage = value;
    });
  }

  late final _$getRegisterAsyncAction =
      AsyncAction('_RegisterStoreBase.getRegister', context: context);

  @override
  Future<void> getRegister(BuildContext context) {
    return _$getRegisterAsyncAction.run(() => super.getRegister(context));
  }

  late final _$getRegisterProductAsyncAction =
      AsyncAction('_RegisterStoreBase.getRegisterProduct', context: context);

  @override
  Future getRegisterProduct(BuildContext context, MyStore myStore) {
    return _$getRegisterProductAsyncAction
        .run(() => super.getRegisterProduct(context, myStore));
  }

  late final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase', context: context);

  @override
  dynamic changeTerm() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.changeTerm');
    try {
      return super.changeTerm();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showHideConfirmIcon() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.showHideConfirmIcon');
    try {
      return super.showHideConfirmIcon();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void showHideIcon() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.showHideIcon');
    try {
      return super.showHideIcon();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    return '''
isLoadLogin: ${isLoadLogin},
showHidePassConfirm: ${showHidePassConfirm},
showHidePass: ${showHidePass},
term: ${term},
actualPage: ${actualPage}
    ''';
  }
}
