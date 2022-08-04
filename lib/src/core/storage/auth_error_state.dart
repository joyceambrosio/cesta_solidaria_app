import 'package:mobx/mobx.dart';

part 'auth_error_state.g.dart';

class AuthErrorState = _AuthErrorState with _$AuthErrorState;

abstract class _AuthErrorState with Store {
  @observable
  String? loggedUser;

  String? instituicao;

  @computed
  bool get hasErrors => loggedUser != null || instituicao != null;
}
