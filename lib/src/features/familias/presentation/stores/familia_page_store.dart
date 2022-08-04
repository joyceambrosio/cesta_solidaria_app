import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_page_familia_store.dart';
import 'package:mobx/mobx.dart';

part 'familia_page_store.g.dart';

class FamiliaPageStore = _FamiliaPageStore with _$FamiliaPageStore;

abstract class _FamiliaPageStore with Store {
  @observable
  FamiliaEntity? familia;

  @observable
  bool isGerandoPdf = false;

  @observable
  bool isDoandoCesta = false;

  FamiliaPageFamiliaStore familiaStore = FamiliaPageFamiliaStore();
  @action
  setFamilia(FamiliaEntity? familia) {
    this.familia = familia;
    familiaStore.setFamilia(familia);
  }
}
