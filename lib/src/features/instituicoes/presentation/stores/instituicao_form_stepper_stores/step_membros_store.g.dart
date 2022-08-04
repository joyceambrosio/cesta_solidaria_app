// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_membros_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepMembrosStore on _StepMembrosStore, Store {
  late final _$isEditAtom =
      Atom(name: '_StepMembrosStore.isEdit', context: context);

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
      Atom(name: '_StepMembrosStore.isAdmin', context: context);

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

  late final _$isProcessingAtom =
      Atom(name: '_StepMembrosStore.isProcessing', context: context);

  @override
  bool get isProcessing {
    _$isProcessingAtom.reportRead();
    return super.isProcessing;
  }

  @override
  set isProcessing(bool value) {
    _$isProcessingAtom.reportWrite(value, super.isProcessing, () {
      super.isProcessing = value;
    });
  }

  late final _$instituicaoAtom =
      Atom(name: '_StepMembrosStore.instituicao', context: context);

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

  late final _$usersFiltroAtom =
      Atom(name: '_StepMembrosStore.usersFiltro', context: context);

  @override
  List<UserAuthEntity> get usersFiltro {
    _$usersFiltroAtom.reportRead();
    return super.usersFiltro;
  }

  @override
  set usersFiltro(List<UserAuthEntity> value) {
    _$usersFiltroAtom.reportWrite(value, super.usersFiltro, () {
      super.usersFiltro = value;
    });
  }

  late final _$usersFiltroLengthAtom =
      Atom(name: '_StepMembrosStore.usersFiltroLength', context: context);

  @override
  int get usersFiltroLength {
    _$usersFiltroLengthAtom.reportRead();
    return super.usersFiltroLength;
  }

  @override
  set usersFiltroLength(int value) {
    _$usersFiltroLengthAtom.reportWrite(value, super.usersFiltroLength, () {
      super.usersFiltroLength = value;
    });
  }

  late final _$roleAtom =
      Atom(name: '_StepMembrosStore.role', context: context);

  @override
  String get role {
    _$roleAtom.reportRead();
    return super.role;
  }

  @override
  set role(String value) {
    _$roleAtom.reportWrite(value, super.role, () {
      super.role = value;
    });
  }

  late final _$membrosAtom =
      Atom(name: '_StepMembrosStore.membros', context: context);

  @override
  List<MembroEntity> get membros {
    _$membrosAtom.reportRead();
    return super.membros;
  }

  @override
  set membros(List<MembroEntity> value) {
    _$membrosAtom.reportWrite(value, super.membros, () {
      super.membros = value;
    });
  }

  late final _$membrosLengthAtom =
      Atom(name: '_StepMembrosStore.membrosLength', context: context);

  @override
  int get membrosLength {
    _$membrosLengthAtom.reportRead();
    return super.membrosLength;
  }

  @override
  set membrosLength(int value) {
    _$membrosLengthAtom.reportWrite(value, super.membrosLength, () {
      super.membrosLength = value;
    });
  }

  late final _$membrosVisualAtom =
      Atom(name: '_StepMembrosStore.membrosVisual', context: context);

  @override
  List<UserAuthEntity> get membrosVisual {
    _$membrosVisualAtom.reportRead();
    return super.membrosVisual;
  }

  @override
  set membrosVisual(List<UserAuthEntity> value) {
    _$membrosVisualAtom.reportWrite(value, super.membrosVisual, () {
      super.membrosVisual = value;
    });
  }

  late final _$membrosVisualLengthAtom =
      Atom(name: '_StepMembrosStore.membrosVisualLength', context: context);

  @override
  int get membrosVisualLength {
    _$membrosVisualLengthAtom.reportRead();
    return super.membrosVisualLength;
  }

  @override
  set membrosVisualLength(int value) {
    _$membrosVisualLengthAtom.reportWrite(value, super.membrosVisualLength, () {
      super.membrosVisualLength = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: '_StepMembrosStore.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$controllerUidAtom =
      Atom(name: '_StepMembrosStore.controllerUid', context: context);

  @override
  TextEditingController get controllerUid {
    _$controllerUidAtom.reportRead();
    return super.controllerUid;
  }

  @override
  set controllerUid(TextEditingController value) {
    _$controllerUidAtom.reportWrite(value, super.controllerUid, () {
      super.controllerUid = value;
    });
  }

  late final _$escolhaAtom =
      Atom(name: '_StepMembrosStore.escolha', context: context);

  @override
  UserAuthEntity? get escolha {
    _$escolhaAtom.reportRead();
    return super.escolha;
  }

  @override
  set escolha(UserAuthEntity? value) {
    _$escolhaAtom.reportWrite(value, super.escolha, () {
      super.escolha = value;
    });
  }

  late final _$_StepMembrosStoreActionController =
      ActionController(name: '_StepMembrosStore', context: context);

  @override
  dynamic removeMembroAt(int index) {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.removeMembroAt');
    try {
      return super.removeMembroAt(index);
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMembro(MembroEntity membroEntity) {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.addMembro');
    try {
      return super.addMembro(membroEntity);
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeMembro(MembroEntity membroEntity) {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.removeMembro');
    try {
      return super.removeMembro(membroEntity);
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMembros(List<MembroEntity> lista) {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.setMembros');
    try {
      return super.setMembros(lista);
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsers(List<UserAuthEntity> users) {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.setUsers');
    try {
      return super.setUsers(users);
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsersFiltro() {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.setUsersFiltro');
    try {
      return super.setUsersFiltro();
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMembrosVisual() {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.setMembrosVisual');
    try {
      return super.setMembrosVisual();
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getNumAdms() {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.getNumAdms');
    try {
      return super.getNumAdms();
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setInstituicao(InstituicaoEntity? instituicaoEntity) {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.setInstituicao');
    try {
      return super.setInstituicao(instituicaoEntity);
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUid() {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.validateUid');
    try {
      return super.validateUid();
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNome() {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.validateNome');
    try {
      return super.validateNome();
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRole() {
    final _$actionInfo = _$_StepMembrosStoreActionController.startAction(
        name: '_StepMembrosStore.validateRole');
    try {
      return super.validateRole();
    } finally {
      _$_StepMembrosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEdit: ${isEdit},
isAdmin: ${isAdmin},
isProcessing: ${isProcessing},
instituicao: ${instituicao},
usersFiltro: ${usersFiltro},
usersFiltroLength: ${usersFiltroLength},
role: ${role},
membros: ${membros},
membrosLength: ${membrosLength},
membrosVisual: ${membrosVisual},
membrosVisualLength: ${membrosVisualLength},
nome: ${nome},
controllerUid: ${controllerUid},
escolha: ${escolha}
    ''';
  }
}
