// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$usuarioAtom = Atom(name: '_AuthStore.usuario', context: context);

  @override
  UserAuthEntity? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UserAuthEntity? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$instituicaoAtom =
      Atom(name: '_AuthStore.instituicao', context: context);

  @override
  InstituicaoEntity? get instituicao {
    _$instituicaoAtom.reportRead();
    return super.instituicao;
  }

  @override
  set instituicao(InstituicaoEntity? value) {
    _$instituicaoAtom.reportWrite(value, super.instituicao, () {
      super.instituicao = value;
    });
  }

  late final _$roleInstituicaoAtom =
      Atom(name: '_AuthStore.roleInstituicao', context: context);

  @override
  MembroEntity? get roleInstituicao {
    _$roleInstituicaoAtom.reportRead();
    return super.roleInstituicao;
  }

  @override
  set roleInstituicao(MembroEntity? value) {
    _$roleInstituicaoAtom.reportWrite(value, super.roleInstituicao, () {
      super.roleInstituicao = value;
    });
  }

  late final _$tokenAtom = Atom(name: '_AuthStore.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_AuthStore.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$setTokenAsyncAction =
      AsyncAction('_AuthStore.setToken', context: context);

  @override
  Future setToken(String token) {
    return _$setTokenAsyncAction.run(() => super.setToken(token));
  }

  late final _$getTokenAsyncAction =
      AsyncAction('_AuthStore.getToken', context: context);

  @override
  Future getToken() {
    return _$getTokenAsyncAction.run(() => super.getToken());
  }

  late final _$setUserAsyncAction =
      AsyncAction('_AuthStore.setUser', context: context);

  @override
  Future setUser(UserAuthEntity? user) {
    return _$setUserAsyncAction.run(() => super.setUser(user));
  }

  late final _$getUserAsyncAction =
      AsyncAction('_AuthStore.getUser', context: context);

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  late final _$isLoggedAsyncAction =
      AsyncAction('_AuthStore.isLogged', context: context);

  @override
  Future isLogged() {
    return _$isLoggedAsyncAction.run(() => super.isLogged());
  }

  late final _$getInstituicaoAsyncAction =
      AsyncAction('_AuthStore.getInstituicao', context: context);

  @override
  Future<InstituicaoEntity?> getInstituicao() {
    return _$getInstituicaoAsyncAction.run(() => super.getInstituicao());
  }

  late final _$hasInstituicaoAsyncAction =
      AsyncAction('_AuthStore.hasInstituicao', context: context);

  @override
  Future hasInstituicao() {
    return _$hasInstituicaoAsyncAction.run(() => super.hasInstituicao());
  }

  late final _$setRoleInstituicaoAsyncAction =
      AsyncAction('_AuthStore.setRoleInstituicao', context: context);

  @override
  Future setRoleInstituicao(MembroEntity? membroEntity) {
    return _$setRoleInstituicaoAsyncAction
        .run(() => super.setRoleInstituicao(membroEntity));
  }

  late final _$getRoleInstituicaoAsyncAction =
      AsyncAction('_AuthStore.getRoleInstituicao', context: context);

  @override
  Future<MembroEntity?> getRoleInstituicao() {
    return _$getRoleInstituicaoAsyncAction
        .run(() => super.getRoleInstituicao());
  }

  late final _$validateLoggedUserAsyncAction =
      AsyncAction('_AuthStore.validateLoggedUser', context: context);

  @override
  Future validateLoggedUser() {
    return _$validateLoggedUserAsyncAction
        .run(() => super.validateLoggedUser());
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  dynamic isAdmin() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.isAdmin');
    try {
      return super.isAdmin();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isAdminInstituicao(String instituicaoId) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.isAdminInstituicao');
    try {
      return super.isAdminInstituicao(instituicaoId);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isAdminOnCurrentInstituicao() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.isAdminOnCurrentInstituicao');
    try {
      return super.isAdminOnCurrentInstituicao();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isInstituicaoMatriz(String instituicaoId) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.isInstituicaoMatriz');
    try {
      return super.isInstituicaoMatriz(instituicaoId);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isOnInstituicao(String instituicaoId) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.isOnInstituicao');
    try {
      return super.isOnInstituicao(instituicaoId);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isActiveOnInstituicao() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.isActiveOnInstituicao');
    try {
      return super.isActiveOnInstituicao();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hasAcessoFamilias() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.hasAcessoFamilias');
    try {
      return super.hasAcessoFamilias();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic hasPermissaoEditarFamilias() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.hasPermissaoEditarFamilias');
    try {
      return super.hasPermissaoEditarFamilias();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
instituicao: ${instituicao},
roleInstituicao: ${roleInstituicao},
token: ${token}
    ''';
  }
}
