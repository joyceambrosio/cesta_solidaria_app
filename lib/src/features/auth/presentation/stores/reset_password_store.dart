import 'package:cartallum_app/src/features/auth/presentation/storestates/reset_password_error_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'reset_password_store.g.dart';

class ResetPasswordStore = _ResetPasswordStore with _$ResetPasswordStore;

abstract class _ResetPasswordStore with Store {
  final ResetPasswordErrorState error = ResetPasswordErrorState();

  @observable
  TextEditingController controllerCodigo = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @observable
  TextEditingController controllerPasswordConfirm = TextEditingController();

  @observable
  bool isLoading = false;

  @action
  void validateAll() {
    validateCodigo();
    validatePassword();
    validatePasswordConfirm();
  }

  @action
  void validateCodigo() {
    if (controllerCodigo.text.isEmpty) {
      error.codigo = 'Por favor, informe o código';
      return;
    }

    if (controllerCodigo.text.length != 6) {
      error.codigo = 'O código contém 6 caracteres';
      return;
    }
    error.codigo = null;
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
