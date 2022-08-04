import 'package:mobx/mobx.dart';

part 'step_familia_error_state.g.dart';

class StepFamiliaErrorState = _TabInstituicaoErrorState
    with _$StepFamiliaErrorState;

abstract class _TabInstituicaoErrorState with Store {
  @observable
  String? renda;

  @computed
  bool get hasErrors => renda != null;
}
