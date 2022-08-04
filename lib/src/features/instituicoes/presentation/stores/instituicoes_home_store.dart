import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/storestates/instituicoes_home_error_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'instituicoes_home_store.g.dart';

class InstituicoesHomeStore = _InstituicoesHomeStore
    with _$InstituicoesHomeStore;

abstract class _InstituicoesHomeStore with Store {
  final InstituicoesHomeErrorState error = InstituicoesHomeErrorState();

  @observable
  bool isGerandoPdf = false;

  @observable
  String? pdfPath;

  @observable
  TextEditingController controllerBusca = TextEditingController();

  @observable
  List<InstituicaoEntity> instituicoes = [];

  @observable
  InstituicaoEntity? instituicaoOfLoggedUser;

  @observable
  List<InstituicaoEntity>? instituicoesOfLoggedUser;

  @observable
  bool isAdminOfLoggedInstituicao = false;

  @observable
  bool isAdmin = false;

  @observable
  int instituicoesLength = 0;

  @observable
  bool isEmpty = false;

  @observable
  bool showFloatingActionButton = true;

  @observable
  Map<String, dynamic> queryParametros = {'sort': '-tipo,verificado,-criadoEm'};

  @action
  setInstituicaoOfLoggedUser(InstituicaoEntity? instituicaoOfLoggedUser) {
    this.instituicaoOfLoggedUser = instituicaoOfLoggedUser;
    List<InstituicaoEntity> aux = List.from(instituicoes);
    aux.remove(instituicaoOfLoggedUser);
    aux.insert(0, instituicaoOfLoggedUser!);
    instituicoes = instituicoes;
    instituicoesLength = instituicoes.length;
  }

  @action
  setInstituicoes(List<InstituicaoEntity> instituicoes) {
    this.instituicoes = instituicoes;
    instituicoesLength = instituicoes.length;
    isEmpty = this.instituicoes.isEmpty;
  }

  @action
  void validateInstituicao() {
    if (controllerBusca.text.isEmpty) {
      error.busca = "O campo não pode ser vazio";
      return;
    }
    error.busca = null;
  }
}
