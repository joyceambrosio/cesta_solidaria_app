// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninStore on _SigninStore, Store {
  late final _$controllerNomeAtom =
      Atom(name: '_SigninStore.controllerNome', context: context);

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

  late final _$controllerEmailAtom =
      Atom(name: '_SigninStore.controllerEmail', context: context);

  @override
  TextEditingController get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  late final _$controllerPasswordAtom =
      Atom(name: '_SigninStore.controllerPassword', context: context);

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

  late final _$controllerPasswordConfirmAtom =
      Atom(name: '_SigninStore.controllerPasswordConfirm', context: context);

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
      Atom(name: '_SigninStore.isLoading', context: context);

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

  late final _$_SigninStoreActionController =
      ActionController(name: '_SigninStore', context: context);

  @override
  void validateTodos() {
    final _$actionInfo = _$_SigninStoreActionController.startAction(
        name: '_SigninStore.validateTodos');
    try {
      return super.validateTodos();
    } finally {
      _$_SigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNome() {
    final _$actionInfo = _$_SigninStoreActionController.startAction(
        name: '_SigninStore.validateNome');
    try {
      return super.validateNome();
    } finally {
      _$_SigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_SigninStoreActionController.startAction(
        name: '_SigninStore.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_SigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_SigninStoreActionController.startAction(
        name: '_SigninStore.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_SigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePasswordConfirm() {
    final _$actionInfo = _$_SigninStoreActionController.startAction(
        name: '_SigninStore.validatePasswordConfirm');
    try {
      return super.validatePasswordConfirm();
    } finally {
      _$_SigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerNome: ${controllerNome},
controllerEmail: ${controllerEmail},
controllerPassword: ${controllerPassword},
controllerPasswordConfirm: ${controllerPasswordConfirm},
isLoading: ${isLoading}
    ''';
  }
}
