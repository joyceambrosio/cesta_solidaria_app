import 'package:mobx/mobx.dart';

part 'step_pessoas_error_state.g.dart';

class StepPessoasErrorState = _StepPessoasErrorState
    with _$StepPessoasErrorState;

abstract class _StepPessoasErrorState with Store {
  @observable
  String? nome;

  @observable
  String? cpf;

  @observable
  String? dataNascimento;

  @observable
  String? sexo;

  @observable
  String? responsavel;

  @observable
  String? telefone;

  @computed
  bool get hasErrors =>
      nome != null ||
      cpf != null ||
      dataNascimento != null ||
      sexo != null ||
      responsavel != null ||
      telefone != null;
}
