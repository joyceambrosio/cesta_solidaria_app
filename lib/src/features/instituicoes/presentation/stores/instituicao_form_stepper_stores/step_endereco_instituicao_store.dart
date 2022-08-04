import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/storestates/step_endereco_error_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'step_endereco_instituicao_store.g.dart';

class StepEnderecoInstituicaoStore = _StepEnderecoInstituicaoStore
    with _$StepEnderecoInstituicaoStore;

abstract class _StepEnderecoInstituicaoStore with Store {
  final StepEnderecoErrorState error = StepEnderecoErrorState();

  @observable
  bool isEdit = true;

  @observable
  bool isAdmin = false;

  @observable
  InstituicaoEntity? instituicao;

  @observable
  EnderecoInstituicaoEntity? endereco;

  @observable
  String tipo = 'matriz';

  @observable
  String pais = 'Brasil';

  @observable
  String estado = 'ES';

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
  setInstituicao(InstituicaoEntity? instituicaoEntity) {
    instituicao = instituicaoEntity;
    if (instituicaoEntity != null) {
      if (instituicaoEntity.enderecos != null) {
        if (instituicaoEntity.enderecos!.isNotEmpty) {
          endereco = instituicaoEntity.enderecos!.first;
          controllerCep.text = endereco!.cep;
          controllerCidade.text = endereco!.cidade;
          controllerLogradouro.text = endereco!.logradouro;
          controllerNumero.text = endereco!.numero ?? '';
          controllerBairro.text = endereco!.bairro;
          controllerComplemento.text = endereco!.complemento ?? '';
          controllerPontoReferencia.text = endereco!.pontoReferencia ?? '';
          estado = endereco!.estado;
          tipo = endereco!.tipoEndereco;
          pais = endereco!.pais;
        }
      }
    }
  }

  @action
  void validateTodos() {
    validateCep();
    validateCidade();
    validateLogradouro();
    validateBairro();
    validateTipo();
    validatePais();
    validateEstado();
  }

  @action
  void validateCep() {
    if (controllerCep.text.isEmpty) {
      error.cep = 'Por favor, informe o cep';
      return;
    }
    if (controllerCep.text.length < 9) {
      error.cep = 'Informe um cep válido';
      return;
    }
    error.cep = null;
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
  void validateTipo() {
    if (tipo.isEmpty) {
      error.tipo = "Por favor, escolha um tipo";
      return;
    }
    error.tipo = null;
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
