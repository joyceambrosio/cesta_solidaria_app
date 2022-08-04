// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_instituicao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepInstituicaoStore on _StepInstituicaoStore, Store {
  late final _$isEditAtom =
      Atom(name: '_StepInstituicaoStore.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$isAdminAtom =
      Atom(name: '_StepInstituicaoStore.isAdmin', context: context);

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

  late final _$instituicaoAtom =
      Atom(name: '_StepInstituicaoStore.instituicao', context: context);

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

  late final _$controllerNomeAtom =
      Atom(name: '_StepInstituicaoStore.controllerNome', context: context);

  @override
  TextEditingController get controllerNome {
    _$controllerNomeAtom.reportRead();
    return super.controllerNome;
  }

  @override
  set controllerNome(TextEditingController value) {
    _$controllerNomeAtom.reportWrite(value, super.controllerNome, () {
      super.controllerNome = value;
    });
  }

  late final _$controllerSiglaAtom =
      Atom(name: '_StepInstituicaoStore.controllerSigla', context: context);

  @override
  TextEditingController get controllerSigla {
    _$controllerSiglaAtom.reportRead();
    return super.controllerSigla;
  }

  @override
  set controllerSigla(TextEditingController value) {
    _$controllerSiglaAtom.reportWrite(value, super.controllerSigla, () {
      super.controllerSigla = value;
    });
  }

  late final _$controllerTelefoneAtom =
      Atom(name: '_StepInstituicaoStore.controllerTelefone', context: context);

  @override
  TextEditingController get controllerTelefone {
    _$controllerTelefoneAtom.reportRead();
    return super.controllerTelefone;
  }

  @override
  set controllerTelefone(TextEditingController value) {
    _$controllerTelefoneAtom.reportWrite(value, super.controllerTelefone, () {
      super.controllerTelefone = value;
    });
  }

  late final _$_StepInstituicaoStoreActionController =
      ActionController(name: '_StepInstituicaoStore', context: context);

  @override
  dynamic setInstituicao(InstituicaoEntity? instituicaoEntity) {
    final _$actionInfo = _$_StepInstituicaoStoreActionController.startAction(
        name: '_StepInstituicaoStore.setInstituicao');
    try {
      return super.setInstituicao(instituicaoEntity);
    } finally {
      _$_StepInstituicaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTodos() {
    final _$actionInfo = _$_StepInstituicaoStoreActionController.startAction(
        name: '_StepInstituicaoStore.validateTodos');
    try {
      return super.validateTodos();
    } finally {
      _$_StepInstituicaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNome() {
    final _$actionInfo = _$_StepInstituicaoStoreActionController.startAction(
        name: '_StepInstituicaoStore.validateNome');
    try {
      return super.validateNome();
    } finally {
      _$_StepInstituicaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateSigla() {
    final _$actionInfo = _$_StepInstituicaoStoreActionController.startAction(
        name: '_StepInstituicaoStore.validateSigla');
    try {
      return super.validateSigla();
    } finally {
      _$_StepInstituicaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelefone() {
    final _$actionInfo = _$_StepInstituicaoStoreActionController.startAction(
        name: '_StepInstituicaoStore.validateTelefone');
    try {
      return super.validateTelefone();
    } finally {
      _$_StepInstituicaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEdit: ${isEdit},
isAdmin: ${isAdmin},
instituicao: ${instituicao},
controllerNome: ${controllerNome},
controllerSigla: ${controllerSigla},
controllerTelefone: ${controllerTelefone}
    ''';
  }
}
