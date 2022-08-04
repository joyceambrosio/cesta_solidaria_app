import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:mobx/mobx.dart';

part 'home_main_page_store.g.dart';

class HomeMainPageStore = _HomeMainPageStore with _$HomeMainPageStore;

abstract class _HomeMainPageStore with Store {
  @observable
  InstituicaoEntity? instituicao;

  @action
  hasInstituicao() {
    return instituicao != null;
  }
}
