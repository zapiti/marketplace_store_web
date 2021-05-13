// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  final _$currentUserAtom = Atom(name: '_AppStoreBase.currentUser');

  @override
  LocalUser get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(LocalUser value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$dateSelectedAtom = Atom(name: '_AppStoreBase.dateSelected');

  @override
  DateTime get dateSelected {
    _$dateSelectedAtom.reportRead();
    return super.dateSelected;
  }

  @override
  set dateSelected(DateTime value) {
    _$dateSelectedAtom.reportWrite(value, super.dateSelected, () {
      super.dateSelected = value;
    });
  }

  final _$setCurrentUserAsyncAction =
      AsyncAction('_AppStoreBase.setCurrentUser');

  @override
  Future<ResponsePaginated<dynamic>> setCurrentUser(LocalUser _currentUser) {
    return _$setCurrentUserAsyncAction
        .run(() => super.setCurrentUser(_currentUser));
  }

  final _$getCurrentUserFutureValueAsyncAction =
      AsyncAction('_AppStoreBase.getCurrentUserFutureValue');

  @override
  Future<LocalUser> getCurrentUserFutureValue() {
    return _$getCurrentUserFutureValueAsyncAction
        .run(() => super.getCurrentUserFutureValue());
  }

  final _$getLogoutAsyncAction = AsyncAction('_AppStoreBase.getLogout');

  @override
  Future getLogout() {
    return _$getLogoutAsyncAction.run(() => super.getLogout());
  }

  final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase');

  @override
  dynamic setSelectedDate(DateTime dateTime) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setSelectedDate');
    try {
      return super.setSelectedDate(dateTime);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
dateSelected: ${dateSelected}
    ''';
  }
}
