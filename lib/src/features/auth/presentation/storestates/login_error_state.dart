import 'package:mobx/mobx.dart';

part 'login_error_state.g.dart';

class LoginErrorState = _LoginErrorState with _$LoginErrorState;

abstract class _LoginErrorState with Store {
  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => email != null || password != null;
}
