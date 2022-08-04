import 'package:mobx/mobx.dart';

part 'step_membros_error_state.g.dart';

class StepMembrosErrorState = _StepMembrosErrorState
    with _$StepMembrosErrorState;

abstract class _StepMembrosErrorState with Store {
  @observable
  String? nome;

  @observable
  String? uid;

  @observable
  String? role;

  @computed
  bool get nameHasErrors => nome != null;

  @computed
  bool get uidhasErrors => uid != null;

  @computed
  bool get hasErrors => nome != null || uid != null || role != null;
}
