// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_familia_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepFamiliaStore on _StepFamiliaStore, Store {
  late final _$isEditAtom =
      Atom(name: '_StepFamiliaStore.isEdit', context: context);

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
      Atom(name: '_StepFamiliaStore.isAdmin', context: context);

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

  late final _$familiaAtom =
      Atom(name: '_StepFamiliaStore.familia', context: context);

  @override
  FamiliaEntity? get familia {
    _$familiaAtom.reportRead();
    return super.familia;
  }

  @override
  set familia(FamiliaEntity? value) {
    _$familiaAtom.reportWrite(value, super.familia, () {
      super.familia = value;
    });
  }

  late final _$controllerRendaAtom =
      Atom(name: '_StepFamiliaStore.controllerRenda', context: context);

  @override
  TextEditingController get controllerRenda {
    _$controllerRendaAtom.reportRead();
    return super.controllerRenda;
  }

  @override
  set controllerRenda(TextEditingController value) {
    _$controllerRendaAtom.reportWrite(value, super.controllerRenda, () {
      super.controllerRenda = value;
    });
  }

  late final _$comprovanteAtom =
      Atom(name: '_StepFamiliaStore.comprovante', context: context);

  @override
  XFile? get comprovante {
    _$comprovanteAtom.reportRead();
    return super.comprovante;
  }

  @override
  set comprovante(XFile? value) {
    _$comprovanteAtom.reportWrite(value, super.comprovante, () {
      super.comprovante = value;
    });
  }

  late final _$_StepFamiliaStoreActionController =
      ActionController(name: '_StepFamiliaStore', context: context);

  @override
  dynamic setFamilia(FamiliaEntity? familiaEntity) {
    final _$actionInfo = _$_StepFamiliaStoreActionController.startAction(
        name: '_StepFamiliaStore.setFamilia');
    try {
      return super.setFamilia(familiaEntity);
    } finally {
      _$_StepFamiliaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTodos() {
    final _$actionInfo = _$_StepFamiliaStoreActionController.startAction(
        name: '_StepFamiliaStore.validateTodos');
    try {
      return super.validateTodos();
    } finally {
      _$_StepFamiliaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRenda() {
    final _$actionInfo = _$_StepFamiliaStoreActionController.startAction(
        name: '_StepFamiliaStore.validateRenda');
    try {
      return super.validateRenda();
    } finally {
      _$_StepFamiliaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEdit: ${isEdit},
isAdmin: ${isAdmin},
familia: ${familia},
controllerRenda: ${controllerRenda},
comprovante: ${comprovante}
    ''';
  }
}
