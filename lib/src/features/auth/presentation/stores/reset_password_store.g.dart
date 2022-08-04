// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResetPasswordStore on _ResetPasswordStore, Store {
  late final _$controllerCodigoAtom =
      Atom(name: '_ResetPasswordStore.controllerCodigo', context: context);

  @override
  TextEditingController get controllerCodigo {
    _$controllerCodigoAtom.reportRead();
    return super.controllerCodigo;
  }

  @override
  set controllerCodigo(TextEditingController value) {
    _$controllerCodigoAtom.reportWrite(value, super.controllerCodigo, () {
      super.controllerCodigo = value;
    });
  }

  late final _$controllerPasswordAtom =
      Atom(name: '_ResetPasswordStore.controllerPassword', context: context);

  @override
  TextEditingController get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  late final _$controllerPasswordConfirmAtom = Atom(
      name: '_ResetPasswordStore.controllerPasswordConfirm', context: context);

  @override
  TextEditingController get controllerPasswordConfirm {
    _$controllerPasswordConfirmAtom.reportRead();
    return super.controllerPasswordConfirm;
  }

  @override
  set controllerPasswordConfirm(TextEditingController value) {
    _$controllerPasswordConfirmAtom
        .reportWrite(value, super.controllerPasswordConfirm, () {
      super.controllerPasswordConfirm = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ResetPasswordStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_ResetPasswordStoreActionController =
      ActionController(name: '_ResetPasswordStore', context: context);

  @override
  void validateAll() {
    final _$actionInfo = _$_ResetPasswordStoreActionController.startAction(
        name: '_ResetPasswordStore.validateAll');
    try {
      return super.validateAll();
    } finally {
      _$_ResetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCodigo() {
    final _$actionInfo = _$_ResetPasswordStoreActionController.startAction(
        name: '_ResetPasswordStore.validateCodigo');
    try {
      return super.validateCodigo();
    } finally {
      _$_ResetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_ResetPasswordStoreActionController.startAction(
        name: '_ResetPasswordStore.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_ResetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePasswordConfirm() {
    final _$actionInfo = _$_ResetPasswordStoreActionController.startAction(
        name: '_ResetPasswordStore.validatePasswordConfirm');
    try {
      return super.validatePasswordConfirm();
    } finally {
      _$_ResetPasswordStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerCodigo: ${controllerCodigo},
controllerPassword: ${controllerPassword},
controllerPasswordConfirm: ${controllerPasswordConfirm},
isLoading: ${isLoading}
    ''';
  }
}
