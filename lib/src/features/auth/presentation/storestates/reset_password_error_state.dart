import 'package:mobx/mobx.dart';

part 'reset_password_error_state.g.dart';

class ResetPasswordErrorState = _ResetPasswordErrorState
    with _$ResetPasswordErrorState;

abstract class _ResetPasswordErrorState with Store {
  @observable
  String? codigo;

  @observable
  String? password;

  @observable
  String? passwordConfirm;

  @computed
  bool get hasErrors =>
      codigo != null || password != null || passwordConfirm != null;
}
