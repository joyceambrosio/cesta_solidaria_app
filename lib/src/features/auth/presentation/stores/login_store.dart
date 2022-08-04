import 'package:cartallum_app/src/features/auth/presentation/storestates/login_error_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginErrorState error = LoginErrorState();

  @observable
  TextEditingController controllerEmail = TextEditingController();
  @observable
  TextEditingController controllerSenha = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  validateTodos() {
    validateEmail();
    validatePassword();
  }

  @action
  void validateEmail() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(controllerEmail.text);

    if (controllerEmail.text.isEmpty || !emailValid) {
      error.email = 'Por favor, informe e-mail';
      return;
    }

    error.email = null;
  }

  @action
  void validatePassword() {
    if (controllerSenha.text.isEmpty) {
      error.password = 'Por favor, informe a senha';
      return;
    }

    if (controllerSenha.text.length < 8) {
      error.password = 'A senha deve conter pelo menos 8 caracteres';
      return;
    }
    error.password = null;
  }
}
