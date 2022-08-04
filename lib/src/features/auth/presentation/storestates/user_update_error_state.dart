import 'package:mobx/mobx.dart';

part 'user_update_error_state.g.dart';

class UserUpdateErrorState = _UserUpdateErrorState with _$UserUpdateErrorState;

abstract class _UserUpdateErrorState with Store {
  @observable
  String? nome;

  @observable
  String? email;

  @observable
  String? oldPassword;

  @observable
  String? password;

  @observable
  String? passwordConfirm;

  @computed
  bool get hasErrorsUser => nome != null || email != null;

  @computed
  bool get hasErrors =>
      nome != null ||
      nome != null ||
      password != null ||
      passwordConfirm != null;
}
