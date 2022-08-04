import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/storestates/step_membros_error_state.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'step_membros_store.g.dart';

class StepMembrosStore = _StepMembrosStore with _$StepMembrosStore;

abstract class _StepMembrosStore with Store {
  final StepMembrosErrorState error = StepMembrosErrorState();

  @observable
  bool isEdit = true;

  @observable
  bool isAdmin = false;

  @observable
  bool isProcessing = false;

  @observable
  InstituicaoEntity? instituicao;

  List<UserAuthEntity> users = [];

  @observable
  List<UserAuthEntity> usersFiltro = [];

  @observable
  int usersFiltroLength = 0;

  @observable
  String role = 'user';

  @observable
  List<MembroEntity> membros = [];

  @observable
  int membrosLength = 0;

  @observable
  List<UserAuthEntity> membrosVisual = [];

  @observable
  int membrosVisualLength = 0;

  @action
  removeMembroAt(int index) {
    membros.removeAt(index);
    membrosLength = membros.length;
  }

  @action
  addMembro(MembroEntity membroEntity) {
    membros.add(membroEntity);
    membrosLength = membros.length;
  }

  @action
  removeMembro(MembroEntity membroEntity) {
    membros.remove(membroEntity);
    membrosLength = membros.length;
  }

  @action
  setMembros(List<MembroEntity> lista) {
    membros = lista;
    membrosLength = lista.length;
  }

  @action
  setUsers(List<UserAuthEntity> users) {
    this.users = users;
  }

  @action
  setUsersFiltro() {
    if (instituicao != null) {
      List<UserAuthEntity> filtro = [];
      List<String> idsMembros = membros.map((e) => e.usuario).toList();

      for (var element in users) {
        if (!idsMembros.contains(element.id)) {
          filtro.add(element);
        }
      }
      usersFiltro = filtro;
      usersFiltroLength = filtro.length;
    } else {
      usersFiltro = users;
      usersFiltroLength = users.length;
    }
  }

  @action
  setMembrosVisual() {
    if (instituicao != null) {
      List<UserAuthEntity> filtro = [];
      List<String> idsMembros = membros.map((e) => e.usuario).toList();

      for (var element in users) {
        if (idsMembros.contains(element.id)) {
          filtro.add(element);
        }
      }
      membrosVisual = filtro;
      membrosVisualLength = filtro.length;
    } else {
      membrosVisual = users;
      membrosVisualLength = users.length;
    }
  }

  @action
  int getNumAdms() {
    int numAdms =
        membros.where((element) => element.role == 'admin').toList().length;
    return numAdms;
  }

  @action
  setInstituicao(InstituicaoEntity? instituicaoEntity) {
    instituicao = instituicaoEntity;
    if (instituicaoEntity != null) {
      if (instituicaoEntity.membros != null) {
        if (instituicaoEntity.membros!.isNotEmpty) {
          membros = instituicaoEntity.membros!;
          membrosLength = instituicaoEntity.membros!.length;
          setMembrosVisual();
          setUsersFiltro();
        } else {
          membros = [];
        }
      }
    }
  }

  @observable
  String nome = '';

  @observable
  TextEditingController controllerUid = TextEditingController();

  @observable
  UserAuthEntity? escolha;

  @action
  void validateUid() {
    if (controllerUid.text.isEmpty) {
      error.uid = 'Por favor, informe um email ou nome válidos.';
      return;
    }
    for (var element in usersFiltro) {
      if (element.name == controllerUid.text) {
        error.uid = null;
        return;
      }
    }
    controllerUid.text = '';
    error.uid = 'Nenhum usuário encontrado para o email ou nome fornecido.';
    return;
  }

  @action
  void validateNome() {
    if (nome.isEmpty) {
      error.nome = 'Por favor, informe uma nome';
      return;
    }
    error.nome = null;
  }

  @action
  void validateRole() {
    if (role.isEmpty) {
      error.role = "Por favor, escolha um papel para o membro";
      return;
    }
    error.role = null;
  }
}
