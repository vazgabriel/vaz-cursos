// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on UserStoreBase, Store {
  final _$userAtom = Atom(name: 'UserStoreBase.user');

  @override
  AuthUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(AuthUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$initUserStoreAsyncAction = AsyncAction('UserStoreBase.initUserStore');

  @override
  Future<void> initUserStore() {
    return _$initUserStoreAsyncAction.run(() => super.initUserStore());
  }

  final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase');

  @override
  void setAuthUser(AuthUser authUser) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setAuthUser');
    try {
      return super.setAuthUser(authUser);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(User user) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.logout');
    try {
      return super.logout();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
