import 'package:mobx/mobx.dart';

part 'forgot_password_error_state.g.dart';

class ForgotPasswordErrorState = _ForgotPasswordErrorState
    with _$ForgotPasswordErrorState;

abstract class _ForgotPasswordErrorState with Store {
  @observable
  String? email;

  @computed
  bool get hasErrors => email != null;
}
