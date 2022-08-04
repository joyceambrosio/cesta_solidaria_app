import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'atividades_store.g.dart';

class AtividadesStore = _AtividadesStore with _$AtividadesStore;

abstract class _AtividadesStore with Store {
  @observable
  bool isGerandoPdf = false;

  @observable
  String? pdfPath;

  @observable
  TextEditingController controllerBusca = TextEditingController();

  @observable
  List<AtividadeEntity> atividades = [];

  @observable
  int atividadesLength = 0;

  @observable
  Map<String, dynamic>? queryParametros;

  @observable
  int limit = 25;

  @observable
  int page = 1;

  @observable
  bool isLastPage = false;

  @observable
  String filterAmigavel = "Nome";

  @observable
  String filter = "nome";

  @observable
  bool isEmpty = false;

  @action
  setAtividades(List<AtividadeEntity> atividades) {
    this.atividades = atividades;
    atividadesLength = atividades.length;
    isEmpty = this.atividades.isEmpty;
  }

  @action
  addAllAtividades(List<AtividadeEntity> atividades) {
    if (atividades.isEmpty) {
      page--;
      isLastPage = true;
      return;
    }

    if (this.atividades.isNotEmpty) {
      this.atividades.addAll(atividades);
      atividadesLength = this.atividades.length;
      isEmpty = this.atividades.isEmpty;
    } else {
      setAtividades(atividades);
    }
  }
}
