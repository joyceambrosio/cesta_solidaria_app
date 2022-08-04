import 'package:mobx/mobx.dart';

part 'escolher_instituicao_error_state.g.dart';

class EscolherInstituicaoErrorState = _EscolherInstituicaoErrorState
    with _$EscolherInstituicaoErrorState;

abstract class _EscolherInstituicaoErrorState with Store {
  @observable
  String? instituicao;
  @observable
  String? instituicaoEscolhida;

  @observable
  String? password;

  @computed
  bool get hasErrors => instituicaoEscolhida != null;
}
