import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_form_stepper_pages_store/step_endereco_store.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_form_stepper_pages_store/step_familia_store.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_form_stepper_pages_store/step_pessoas_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/storestates/instituicoes_home_error_state.dart';
import 'package:mobx/mobx.dart';

part 'familia_form_stepper_store.g.dart';

class FamiliaFormStepperStore = _FamiliaFormStepperStore
    with _$FamiliaFormStepperStore;

abstract class _FamiliaFormStepperStore with Store {
  final InstituicoesHomeErrorState error = InstituicoesHomeErrorState();

  @observable
  FamiliaEntity? familia;

  StepFamiliaStore familiaStore = StepFamiliaStore();
  StepEnderecoStore enderecoStore = StepEnderecoStore();
  StepPessoasStore pessoasStore = StepPessoasStore();

  @action
  setFamilia(FamiliaEntity? familia) {
    this.familia = familia;

    familiaStore.setFamilia(familia);
    enderecoStore.setFamilia(familia);
    pessoasStore.setFamilia(familia);
  }

  @observable
  Map<String, dynamic> queryParametros = {};
}
