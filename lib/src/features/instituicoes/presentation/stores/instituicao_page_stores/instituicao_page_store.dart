import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:mobx/mobx.dart';

part 'instituicao_page_store.g.dart';

class InstituicaoPageStore = _InstituicaoPageStore with _$InstituicaoPageStore;

abstract class _InstituicaoPageStore with Store {
  @observable
  InstituicaoEntity? instituicao;

  @observable
  bool isGerandoPdf = false;

  @observable
  String? pdfPath;

  @observable
  int membrosLenght = 0;

  @observable
  bool isLoadingConvite = false;

  // FamiliaPageFamiliaStore familiaStore = FamiliaPageFamiliaStore();
  @action
  setInstituicao(InstituicaoEntity? instituicao) {
    this.instituicao = instituicao;
    if (instituicao != null) {
      if (instituicao.membros != null) {
        membrosLenght = instituicao.membros?.length ?? 0;
      }
    }
  }
}
