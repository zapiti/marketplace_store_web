// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountStore on _AccountStoreBase, Store {
  final _$walletDataAtom = Atom(name: '_AccountStoreBase.walletData');

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

  final _$accountInfoAtom = Atom(name: '_AccountStoreBase.accountInfo');

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

  final _$getListWalletTransitionAsyncAction =
      AsyncAction('_AccountStoreBase.getListWalletTransition');

  @override
  Future<void> getListWalletTransition() {
    return _$getListWalletTransitionAsyncAction
        .run(() => super.getListWalletTransition());
  }

  final _$getAccountInfoAsyncAction =
      AsyncAction('_AccountStoreBase.getAccountInfo');

  @override
  Future<void> getAccountInfo() {
    return _$getAccountInfoAsyncAction.run(() => super.getAccountInfo());
  }

  final _$updateAccountAsyncAction =
      AsyncAction('_AccountStoreBase.updateAccount');

  @override
  Future<void> updateAccount(BuildContext context, AccountInfo _accountInfo) {
    return _$updateAccountAsyncAction
        .run(() => super.updateAccount(context, _accountInfo));
  }

  @override
  String toString() {
    return '''
walletData: ${walletData},
accountInfo: ${accountInfo}
    ''';
  }
}
