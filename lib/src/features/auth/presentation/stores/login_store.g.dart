// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStore, Store {
  late final _$controllerEmailAtom =
      Atom(name: '_LoginStore.controllerEmail', context: context);

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

  late final _$controllerSenhaAtom =
      Atom(name: '_LoginStore.controllerSenha', context: context);

  @override
  TextEditingController get controllerSenha {
    _$controllerSenhaAtom.reportRead();
    return super.controllerSenha;
  }

  @override
  set controllerSenha(TextEditingController value) {
    _$controllerSenhaAtom.reportWrite(value, super.controllerSenha, () {
      super.controllerSenha = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_LoginStore.isLoading', context: context);

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

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  dynamic validateTodos() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validateTodos');
    try {
      return super.validateTodos();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controllerEmail: ${controllerEmail},
controllerSenha: ${controllerSenha},
isLoading: ${isLoading}
    ''';
  }
}
