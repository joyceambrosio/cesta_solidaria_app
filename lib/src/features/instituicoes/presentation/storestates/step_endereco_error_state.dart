import 'package:mobx/mobx.dart';

part 'step_endereco_error_state.g.dart';

class StepEnderecoErrorState = _StepEnderecoErrorState
    with _$StepEnderecoErrorState;

abstract class _StepEnderecoErrorState with Store {
  @observable
  String? tipo;
  @observable
  String? pais;
  @observable
  String? estado;
  @observable
  String? cep;
  @observable
  String? cidade;
  @observable
  String? logradouro;
  @observable
  String? numero;
  @observable
  String? bairro;
  @observable
  String? complemento;
  @observable
  String? pontoReferencia;

  @computed
  bool get hasErrors =>
      tipo != null ||
      pais != null ||
      estado != null ||
      cep != null ||
      cidade != null ||
      logradouro != null ||
      numero != null ||
      bairro != null ||
      complemento != null ||
      pontoReferencia != null;
}
