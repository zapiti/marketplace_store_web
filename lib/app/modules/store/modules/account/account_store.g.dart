// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountStore on _AccountStoreBase, Store {
  late final _$walletDataAtom =
      Atom(name: '_AccountStoreBase.walletData', context: context);

  @override
  WalletData? get walletData {
    _$walletDataAtom.reportRead();
    return super.walletData;
  }

  @override
  set walletData(WalletData? value) {
    _$walletDataAtom.reportWrite(value, super.walletData, () {
      super.walletData = value;
    });
  }

  late final _$showPassActualAtom =
      Atom(name: '_AccountStoreBase.showPassActual', context: context);

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
      Atom(name: '_AccountStoreBase.showPass', context: context);

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
      Atom(name: '_AccountStoreBase.showPassConfirm', context: context);

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

  late final _$accountInfoAtom =
      Atom(name: '_AccountStoreBase.accountInfo', context: context);

  @override
  AccountInfo get accountInfo {
    _$accountInfoAtom.reportRead();
    return super.accountInfo;
  }

  @override
  set accountInfo(AccountInfo value) {
    _$accountInfoAtom.reportWrite(value, super.accountInfo, () {
      super.accountInfo = value;
    });
  }

  late final _$getListWalletTransitionAsyncAction = AsyncAction(
      '_AccountStoreBase.getListWalletTransition',
      context: context);

  @override
  Future<void> getListWalletTransition() {
    return _$getListWalletTransitionAsyncAction
        .run(() => super.getListWalletTransition());
  }

  late final _$getAccountInfoAsyncAction =
      AsyncAction('_AccountStoreBase.getAccountInfo', context: context);

  @override
  Future<void> getAccountInfo() {
    return _$getAccountInfoAsyncAction.run(() => super.getAccountInfo());
  }

  late final _$changePassAsyncAction =
      AsyncAction('_AccountStoreBase.changePass', context: context);

  @override
  Future<void> changePass(BuildContext context) {
    return _$changePassAsyncAction.run(() => super.changePass(context));
  }

  late final _$updateAccountAsyncAction =
      AsyncAction('_AccountStoreBase.updateAccount', context: context);

  @override
  Future<void> updateAccount(BuildContext context, AccountInfo _accountInfo) {
    return _$updateAccountAsyncAction
        .run(() => super.updateAccount(context, _accountInfo));
  }

  late final _$_AccountStoreBaseActionController =
      ActionController(name: '_AccountStoreBase', context: context);

  @override
  dynamic hideActualPass() {
    final _$actionInfo = _$_AccountStoreBaseActionController.startAction(
        name: '_AccountStoreBase.hideActualPass');
    try {
      return super.hideActualPass();
    } finally {
      _$_AccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hidePass() {
    final _$actionInfo = _$_AccountStoreBaseActionController.startAction(
        name: '_AccountStoreBase.hidePass');
    try {
      return super.hidePass();
    } finally {
      _$_AccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hidePassConfirm() {
    final _$actionInfo = _$_AccountStoreBaseActionController.startAction(
        name: '_AccountStoreBase.hidePassConfirm');
    try {
      return super.hidePassConfirm();
    } finally {
      _$_AccountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
walletData: ${walletData},
showPassActual: ${showPassActual},
showPass: ${showPass},
showPassConfirm: ${showPassConfirm},
accountInfo: ${accountInfo}
    ''';
  }
}
