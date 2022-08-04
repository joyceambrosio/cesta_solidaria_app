import 'package:mobx/mobx.dart';

part 'step_instituicao_error_state.g.dart';

class StepInstituicaoErrorState = _StepInstituicaoErrorState
    with _$StepInstituicaoErrorState;

abstract class _StepInstituicaoErrorState with Store {
  @observable
  String? nome;

  @observable
  String? sigla;

  @observable
  String? telefone;

  @computed
  bool get hasErrors => nome != null || sigla != null || telefone != null;
}
