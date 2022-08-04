import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/storestates/step_instituicao_error_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'step_instituicao_store.g.dart';

class StepInstituicaoStore = _StepInstituicaoStore with _$StepInstituicaoStore;

abstract class _StepInstituicaoStore with Store {
  final StepInstituicaoErrorState error = StepInstituicaoErrorState();

  @observable
  bool isEdit = true;

  @observable
  bool isAdmin = false;

  @observable
  InstituicaoEntity? instituicao;

  @observable
  TextEditingController controllerNome = TextEditingController();

  @observable
  TextEditingController controllerSigla = TextEditingController();

  @observable
  TextEditingController controllerTelefone = TextEditingController();

  @action
  setInstituicao(InstituicaoEntity? instituicaoEntity) {
    instituicao = instituicaoEntity;
    if (instituicaoEntity != null) {
      controllerNome.text = instituicao?.nome ?? '';
      controllerSigla.text = instituicao?.sigla ?? '';
      controllerTelefone.text = instituicao?.telefone ?? '';
    }
  }

  @action
  void validateTodos() {
    validateNome();
    validateSigla();
    validateTelefone();
  }

  @action
  void validateNome() {
    if (controllerNome.text.isEmpty) {
      error.nome = 'Por favor, informe o nome da Instituição';
      return;
    }
    error.nome = null;
  }

  @action
  void validateSigla() {
    if (controllerSigla.text.length >= 8) {
      error.sigla = 'A sigla deve ser ter menos de 8 caracteres';
      return;
    }
    error.sigla = null;
  }

  @action
  void validateTelefone() {
    if (controllerTelefone.text.isEmpty) {
      error.telefone = 'Informe um telefone';
      return;
    }

    if (controllerTelefone.text.length < 14) {
      error.telefone = 'Informe um telefone válido';
      return;
    }
    error.telefone = null;
  }
}
