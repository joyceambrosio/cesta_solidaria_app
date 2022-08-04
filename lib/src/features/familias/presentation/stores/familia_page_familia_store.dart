import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:mobx/mobx.dart';

part 'familia_page_familia_store.g.dart';

class FamiliaPageFamiliaStore = _FamiliaPageFamiliaStore
    with _$FamiliaPageFamiliaStore;

abstract class _FamiliaPageFamiliaStore with Store {
  @observable
  FamiliaEntity? familia;

  @observable
  List<CestaEntity> cestas = [];

  @observable
  int cestasLength = 0;

  @action
  addCesta(CestaEntity cestaEntity) {
    cestas.insert(0, cestaEntity);
    cestasLength = cestas.length;
  }

  @action
  setFamilia(FamiliaEntity? familia) {
    this.familia = familia;
    if (familia != null) {
      if (familia.cestas != null) {
        cestas = familia.cestas!;
        cestasLength = cestas.length;
      }
    }
  }

  @observable
  Map<String, dynamic> queryParametros = {};
}
