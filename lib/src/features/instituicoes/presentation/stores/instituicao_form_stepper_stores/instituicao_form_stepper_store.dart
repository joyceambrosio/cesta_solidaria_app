import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/step_endereco_instituicao_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/step_instituicao_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/step_membros_store.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:mobx/mobx.dart';

part 'instituicao_form_stepper_store.g.dart';

class InstituicaoFormStepperStore = _InstituicaoFormStepperStore
    with _$InstituicaoFormStepperStore;

abstract class _InstituicaoFormStepperStore with Store {
  @observable
  InstituicaoEntity? instituicao;

  @observable
  bool isValid = false;

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingAddMembro = false;

  StepInstituicaoStore instituicaoStore = StepInstituicaoStore();
  StepEnderecoInstituicaoStore enderecoStore = StepEnderecoInstituicaoStore();
  StepMembrosStore membrosStore = StepMembrosStore();

  @action
  setInstituicao(InstituicaoEntity? instituicao) {
    this.instituicao = instituicao;

    instituicaoStore.setInstituicao(instituicao);
    enderecoStore.setInstituicao(instituicao);
    membrosStore.setInstituicao(instituicao);
  }

  @action
  setPublicUsers(List<UserAuthEntity> users) {
    membrosStore.setUsers(users);
    membrosStore.setUsersFiltro();
    membrosStore.setMembrosVisual();
  }

  @observable
  Map<String, dynamic> queryParametros = {};
}
