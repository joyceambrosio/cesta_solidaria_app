import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';

import 'package:mobx/mobx.dart';

part 'config_store.g.dart';

class ConfigStore = _ConfigStore with _$ConfigStore;

abstract class _ConfigStore with Store {
  ConfigEntity configLimiteCestas = ConfigEntity(
    id: '',
    descricao: 'usaLimiteCestas',
    mensagemErro: 'mensagemErro',
    usa: true,
    restringe: false,
    limite: 3,
  );
  ConfigEntity configLimiteRenda = ConfigEntity(
    id: '',
    descricao: 'usaLimiteRenda',
    mensagemErro: 'mensagemErro',
    usa: false,
    restringe: false,
    limite: 1212,
  );
  ConfigEntity configLimiteCestasPerCapita = ConfigEntity(
    id: '',
    descricao: 'usaLimiteRendaPerCapita',
    mensagemErro: 'mensagemErro',
    usa: true,
    restringe: false,
    limite: 178,
  );

  @action
  setConfigs(List<ConfigEntity>? lista) {
    if (lista == null) return;
    for (var element in lista) {
      switch (element.descricao) {
        case 'usaLimiteCestas':
          configLimiteCestas = element;
          break;
        case 'usaLimiteRenda':
          configLimiteRenda = element;

          break;
        case 'usaLimiteRendaPerCapita':
          configLimiteCestasPerCapita = element;
          break;
        default:
          break;
      }
    }
  }
}
