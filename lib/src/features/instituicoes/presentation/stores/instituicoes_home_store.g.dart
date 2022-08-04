// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instituicoes_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituicoesHomeStore on _InstituicoesHomeStore, Store {
  late final _$isGerandoPdfAtom =
      Atom(name: '_InstituicoesHomeStore.isGerandoPdf', context: context);

  @override
  bool get isGerandoPdf {
    _$isGerandoPdfAtom.reportRead();
    return super.isGerandoPdf;
  }

  @override
  set isGerandoPdf(bool value) {
    _$isGerandoPdfAtom.reportWrite(value, super.isGerandoPdf, () {
      super.isGerandoPdf = value;
    });
  }

  late final _$pdfPathAtom =
      Atom(name: '_InstituicoesHomeStore.pdfPath', context: context);

  @override
  String? get pdfPath {
    _$pdfPathAtom.reportRead();
    return super.pdfPath;
  }

  @override
  set pdfPath(String? value) {
    _$pdfPathAtom.reportWrite(value, super.pdfPath, () {
      super.pdfPath = value;
    });
  }

  late final _$controllerBuscaAtom =
      Atom(name: '_InstituicoesHomeStore.controllerBusca', context: context);

  @override
  TextEditingController get controllerBusca {
    _$controllerBuscaAtom.reportRead();
    return super.controllerBusca;
  }

  @override
  set controllerBusca(TextEditingController value) {
    _$controllerBuscaAtom.reportWrite(value, super.controllerBusca, () {
      super.controllerBusca = value;
    });
  }

  late final _$instituicoesAtom =
      Atom(name: '_InstituicoesHomeStore.instituicoes', context: context);

  @override
  List<InstituicaoEntity> get instituicoes {
    _$instituicoesAtom.reportRead();
    return super.instituicoes;
  }

  @override
  set instituicoes(List<InstituicaoEntity> value) {
    _$instituicoesAtom.reportWrite(value, super.instituicoes, () {
      super.instituicoes = value;
    });
  }

  late final _$instituicaoOfLoggedUserAtom = Atom(
      name: '_InstituicoesHomeStore.instituicaoOfLoggedUser', context: context);

  @override
  InstituicaoEntity? get instituicaoOfLoggedUser {
    _$instituicaoOfLoggedUserAtom.reportRead();
    return super.instituicaoOfLoggedUser;
  }

  @override
  set instituicaoOfLoggedUser(InstituicaoEntity? value) {
    _$instituicaoOfLoggedUserAtom
        .reportWrite(value, super.instituicaoOfLoggedUser, () {
      super.instituicaoOfLoggedUser = value;
    });
  }

  late final _$instituicoesOfLoggedUserAtom = Atom(
      name: '_InstituicoesHomeStore.instituicoesOfLoggedUser',
      context: context);

  @override
  List<InstituicaoEntity>? get instituicoesOfLoggedUser {
    _$instituicoesOfLoggedUserAtom.reportRead();
    return super.instituicoesOfLoggedUser;
  }

  @override
  set instituicoesOfLoggedUser(List<InstituicaoEntity>? value) {
    _$instituicoesOfLoggedUserAtom
        .reportWrite(value, super.instituicoesOfLoggedUser, () {
      super.instituicoesOfLoggedUser = value;
    });
  }

  late final _$isAdminOfLoggedInstituicaoAtom = Atom(
      name: '_InstituicoesHomeStore.isAdminOfLoggedInstituicao',
      context: context);

  @override
  bool get isAdminOfLoggedInstituicao {
    _$isAdminOfLoggedInstituicaoAtom.reportRead();
    return super.isAdminOfLoggedInstituicao;
  }

  @override
  set isAdminOfLoggedInstituicao(bool value) {
    _$isAdminOfLoggedInstituicaoAtom
        .reportWrite(value, super.isAdminOfLoggedInstituicao, () {
      super.isAdminOfLoggedInstituicao = value;
    });
  }

  late final _$isAdminAtom =
      Atom(name: '_InstituicoesHomeStore.isAdmin', context: context);

  @override
  bool get isAdmin {
    _$isAdminAtom.reportRead();
    return super.isAdmin;
  }

  @override
  set isAdmin(bool value) {
    _$isAdminAtom.reportWrite(value, super.isAdmin, () {
      super.isAdmin = value;
    });
  }

  late final _$instituicoesLengthAtom =
      Atom(name: '_InstituicoesHomeStore.instituicoesLength', context: context);

  @override
  int get instituicoesLength {
    _$instituicoesLengthAtom.reportRead();
    return super.instituicoesLength;
  }

  @override
  set instituicoesLength(int value) {
    _$instituicoesLengthAtom.reportWrite(value, super.instituicoesLength, () {
      super.instituicoesLength = value;
    });
  }

  late final _$isEmptyAtom =
      Atom(name: '_InstituicoesHomeStore.isEmpty', context: context);

  @override
  bool get isEmpty {
    _$isEmptyAtom.reportRead();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    _$isEmptyAtom.reportWrite(value, super.isEmpty, () {
      super.isEmpty = value;
    });
  }

  late final _$showFloatingActionButtonAtom = Atom(
      name: '_InstituicoesHomeStore.showFloatingActionButton',
      context: context);

  @override
  bool get showFloatingActionButton {
    _$showFloatingActionButtonAtom.reportRead();
    return super.showFloatingActionButton;
  }

  @override
  set showFloatingActionButton(bool value) {
    _$showFloatingActionButtonAtom
        .reportWrite(value, super.showFloatingActionButton, () {
      super.showFloatingActionButton = value;
    });
  }

  late final _$queryParametrosAtom =
      Atom(name: '_InstituicoesHomeStore.queryParametros', context: context);

  @override
  Map<String, dynamic> get queryParametros {
    _$queryParametrosAtom.reportRead();
    return super.queryParametros;
  }

  @override
  set queryParametros(Map<String, dynamic> value) {
    _$queryParametrosAtom.reportWrite(value, super.queryParametros, () {
      super.queryParametros = value;
    });
  }

  late final _$_InstituicoesHomeStoreActionController =
      ActionController(name: '_InstituicoesHomeStore', context: context);

  @override
  dynamic setInstituicaoOfLoggedUser(
      InstituicaoEntity? instituicaoOfLoggedUser) {
    final _$actionInfo = _$_InstituicoesHomeStoreActionController.startAction(
        name: '_InstituicoesHomeStore.setInstituicaoOfLoggedUser');
    try {
      return super.setInstituicaoOfLoggedUser(instituicaoOfLoggedUser);
    } finally {
      _$_InstituicoesHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstituicoes(List<InstituicaoEntity> instituicoes) {
    final _$actionInfo = _$_InstituicoesHomeStoreActionController.startAction(
        name: '_InstituicoesHomeStore.setInstituicoes');
    try {
      return super.setInstituicoes(instituicoes);
    } finally {
      _$_InstituicoesHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateInstituicao() {
    final _$actionInfo = _$_InstituicoesHomeStoreActionController.startAction(
        name: '_InstituicoesHomeStore.validateInstituicao');
    try {
      return super.validateInstituicao();
    } finally {
      _$_InstituicoesHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isGerandoPdf: ${isGerandoPdf},
pdfPath: ${pdfPath},
controllerBusca: ${controllerBusca},
instituicoes: ${instituicoes},
instituicaoOfLoggedUser: ${instituicaoOfLoggedUser},
instituicoesOfLoggedUser: ${instituicoesOfLoggedUser},
isAdminOfLoggedInstituicao: ${isAdminOfLoggedInstituicao},
isAdmin: ${isAdmin},
instituicoesLength: ${instituicoesLength},
isEmpty: ${isEmpty},
showFloatingActionButton: ${showFloatingActionButton},
queryParametros: ${queryParametros}
    ''';
  }
}
