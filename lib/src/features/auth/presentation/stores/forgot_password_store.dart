import 'package:cartallum_app/src/features/auth/presentation/storestates/forgot_password_error_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'forgot_password_store.g.dart';

class ForgotPasswordStore = _ForgotPasswordStore with _$ForgotPasswordStore;

abstract class _ForgotPasswordStore with Store {
  final ForgotPasswordErrorState error = ForgotPasswordErrorState();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  bool isLoading = false;

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
}
