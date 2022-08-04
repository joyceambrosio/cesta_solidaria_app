import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_home_filtro_store.dart';
import 'package:cartallum_app/src/features/familias/presentation/storestates/familias_home_error_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'familias_home_store.g.dart';

class FamiliasHomeStore = _FamiliasHomeStore with _$FamiliasHomeStore;

abstract class _FamiliasHomeStore with Store {
  final FamiliasHomeErrorState error = FamiliasHomeErrorState();

  final FamiliaController controller = Modular.get<FamiliaController>();
  final FamiliaHomeFiltroStore filtroStore = FamiliaHomeFiltroStore();

  @observable
  bool isGerandoPdf = false;

  @observable
  String? pdfPath;

  @observable
  TextEditingController controllerBusca = TextEditingController();

  @observable
  List<FamiliaEntity> familias = [];

  @observable
  int familiasLength = 0;

  @observable
  Map<String, dynamic>? queryParametros;

  @observable
  int limit = 5;

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
  setFamilias(List<FamiliaEntity> familias) {
    this.familias = familias;
    familiasLength = familias.length;
    isEmpty = this.familias.isEmpty;
    if (familias.length < limit) {
      isLastPage = true;
    }
  }

  @action
  addAllFamilias(List<FamiliaEntity> familias) {
    if (familias.isEmpty) {
      page--;
      isLastPage = true;
      isEmpty = this.familias.isEmpty;
      return;
    }

    if (this.familias.isNotEmpty) {
      this.familias.addAll(familias);
      familiasLength = this.familias.length;
      isEmpty = this.familias.isEmpty;
    } else {
      setFamilias(familias);
    }
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
