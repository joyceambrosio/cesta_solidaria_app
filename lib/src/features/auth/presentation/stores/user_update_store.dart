import 'package:cartallum_app/src/features/auth/presentation/storestates/user_update_error_state.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'user_update_store.g.dart';

class UpdateUserStore = _UpdateUserStore with _$UpdateUserStore;

abstract class _UpdateUserStore with Store {
  final UserUpdateErrorState error = UserUpdateErrorState();

  @observable
  UserAuthEntity? user;

  @observable
  bool isEditing = false;

  @observable
  bool isLoading = false;

  @observable
  String photo = 'default.jpg';

  @observable
  TextEditingController controllerRole = TextEditingController();

  @observable
  TextEditingController controllerUid = TextEditingController();

  @observable
  TextEditingController controllerNome = TextEditingController();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerOldPassword = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @observable
  TextEditingController controllerPasswordConfirm = TextEditingController();

  @action
  void setUser(UserAuthEntity user) {
    user = user;
    controllerRole.text = user.role == "admin" ? "Administrador" : "Usuário";
    controllerUid.text = user.id;
    controllerNome.text = user.name;
    controllerEmail.text = user.email;
    photo = user.photo;
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
  void validateOldPassword() {
    if (controllerPassword.text.isEmpty) {
      error.oldPassword = 'Por favor, informe a senha antiga';
      return;
    }

    if (controllerPassword.text.length < 8) {
      error.oldPassword = 'A senha deve conter pelo menos 8 caracteres';
      return;
    }
    error.oldPassword = null;
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
