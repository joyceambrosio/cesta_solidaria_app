import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/storestates/step_endereco_error_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'step_endereco_store.g.dart';

class StepEnderecoStore = _StepEnderecoStore with _$StepEnderecoStore;

abstract class _StepEnderecoStore with Store {
  final StepEnderecoErrorState error = StepEnderecoErrorState();

  @observable
  bool isEdit = true;

  @observable
  bool isAdmin = false;

  @observable
  FamiliaEntity? familia;

  @observable
  EnderecoEntity? endereco;

  @observable
  String pais = 'Brasil';

  @observable
  String estado = 'ES';

  @observable
  XFile? comprovante;

  @observable
  TextEditingController controllerCep = TextEditingController();

  @observable
  TextEditingController controllerCidade = TextEditingController();

  @observable
  TextEditingController controllerLogradouro = TextEditingController();

  @observable
  TextEditingController controllerNumero = TextEditingController();

  @observable
  TextEditingController controllerBairro = TextEditingController();

  @observable
  TextEditingController controllerComplemento = TextEditingController();

  @observable
  TextEditingController controllerPontoReferencia = TextEditingController();

  @action
  setFamilia(FamiliaEntity? familiaEntity) {
    familia = familiaEntity;
    if (familiaEntity != null) {
      if (familiaEntity.endereco != null) {
        endereco = familiaEntity.endereco;
        controllerCep.text = endereco!.cep;
        controllerCidade.text = endereco!.cidade;
        controllerLogradouro.text = endereco!.logradouro;
        controllerNumero.text = endereco!.numero;
        controllerBairro.text = endereco!.bairro;
        controllerComplemento.text = endereco!.complemento;
        controllerPontoReferencia.text = endereco!.pontoReferencia;
        estado = endereco!.estado;
        pais = endereco!.pais;
      }
    }
  }

  @action
  void validateTodos() {
    validateCep();
    validateCidade();
    validateLogradouro();
    validateBairro();
    validatePais();
    validateEstado();
  }

  @action
  void validateCep() {
    if (controllerCep.text.isEmpty) {
      error.cep = 'Por favor, informe o cep';
      return;
    }
    error.cep = null;
  }

  @action
  void validateCidade() {
    if (controllerCidade.text.isEmpty) {
      error.cidade = 'Por favor, informe a cidade';
      return;
    }
    error.cidade = null;
  }

  @action
  void validateLogradouro() {
    if (controllerLogradouro.text.isEmpty) {
      error.logradouro = 'Por favor, informe o logradouro';
      return;
    }
    error.logradouro = null;
  }

  @action
  void validateBairro() {
    if (controllerBairro.text.isEmpty) {
      error.bairro = 'Por favor, informe o bairro';
      return;
    }
    error.bairro = null;
  }

  @action
  void validatePais() {
    if (pais.isEmpty) {
      error.pais = "Por favor, escolha um país";
      return;
    }
    error.pais = null;
  }

  @action
  void validateEstado() {
    if (estado.isEmpty) {
      error.estado = "Por favor, escolha um estado";
      return;
    }
    error.estado = null;
  }
}
