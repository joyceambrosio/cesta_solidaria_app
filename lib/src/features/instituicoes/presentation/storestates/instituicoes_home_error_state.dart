import 'package:mobx/mobx.dart';

part 'instituicoes_home_error_state.g.dart';

class InstituicoesHomeErrorState = _InstituicoesHomeErrorState
    with _$InstituicoesHomeErrorState;

abstract class _InstituicoesHomeErrorState with Store {
  @observable
  String? busca;

  @computed
  bool get hasErrors => busca != null;
}
