// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStoreBase, Store {
  late final _$currentUserAtom =
      Atom(name: '_AppStoreBase.currentUser', context: context);

  @override
  CurrentUser? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(CurrentUser? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  @override
  ObservableFuture<CurrentUser?> getCurrentUserFutureValue() {
    final _$future = super.getCurrentUserFutureValue();
    return ObservableFuture<CurrentUser?>(_$future, context: context);
  }

  late final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase', context: context);

  @override
  void setCurrentUser(CurrentUser _currentUser) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.setCurrentUser');
    try {
      return super.setCurrentUser(_currentUser);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
