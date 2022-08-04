import 'package:mobx/mobx.dart';

part 'signin_store_error_state.g.dart';

class SigninErrorState = _SigninErrorState with _$SigninErrorState;

abstract class _SigninErrorState with Store {
  @observable
  String? nome;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? passwordConfirm;

  @computed
  bool get hasErrors =>
      nome != null ||
      nome != null ||
      password != null ||
      passwordConfirm != null;
}
