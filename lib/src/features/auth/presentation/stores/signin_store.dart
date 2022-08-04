import 'package:cartallum_app/src/features/auth/presentation/storestates/signin_store_error_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'signin_store.g.dart';

class SigninStore = _SigninStore with _$SigninStore;

abstract class _SigninStore with Store {
  final SigninErrorState error = SigninErrorState();

  @observable
  TextEditingController controllerNome = TextEditingController();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @observable
  TextEditingController controllerPasswordConfirm = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  void validateTodos() {
    validateNome();
    validateEmail();
    validatePassword();
    validatePasswordConfirm();
  }

  @action
  void validateNome() {
    if (controllerNome.text.isEmpty) {
      error.nome = 'Por favor, informe o seu nome completo';
      return;
    }

    if (controllerNome.text.length <= 5) {
      error.nome = 'O seu nome deve ter mais do que 5 caracteres';
      return;
    }
    error.nome = null;
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
    if (controllerPassword.text.isEmpty) {
      error.password = 'Por favor, informe a senha';
      return;
    }

    if (controllerPassword.text.length < 8) {
      error.password = 'A senha deve conter pelo menos 8 caracteres';
      return;
    }
    error.password = null;
  }

  @action
  void validatePasswordConfirm() {
    if (controllerPassword.text != controllerPasswordConfirm.text) {
      error.passwordConfirm = 'As senhas devem ser iguais';
      return;
    }

    error.passwordConfirm = null;
  }
}
