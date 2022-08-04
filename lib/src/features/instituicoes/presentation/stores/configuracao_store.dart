import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:mobx/mobx.dart';

part 'configuracao_store.g.dart';

class CofiguracaoStore = _CofiguracaoStore with _$CofiguracaoStore;

abstract class _CofiguracaoStore with Store {
  @observable
  bool? usaLimiteCestas;
  @observable
  bool? restringeLimiteCestas;
  @observable
  double? limiteCestas;

  @observable
  bool? usaLimiteRenda;
  @observable
  bool? restringeLimiteRenda;
  @observable
  double? limiteRenda;

  @observable
  bool? usaLimiteRendaPerCapita;
  @observable
  bool? restringeRendaPerCapita;
  @observable
  double? limiteRendaPerCapita;

  ConfigEntity? configLimiteCestas;
  ConfigEntity? configLimiteRend;
  ConfigEntity? configLimiteCestasPerCapita;

  @action
  setConfigs(List<ConfigEntity>? lista) {
    if (lista == null) return;
    for (var element in lista) {
      switch (element.descricao) {
        case 'usaLimiteCestas':
          configLimiteCestas = element;
          usaLimiteCestas = element.usa;
          restringeLimiteCestas = element.restringe;
          limiteCestas = element.limite;
          break;
        case 'usaLimiteRenda':
          configLimiteRend = element;
          usaLimiteRenda = element.usa;
          restringeLimiteRenda = element.restringe;
          limiteRenda = element.limite;
          break;
        case 'usaLimiteRendaPerCapita':
          configLimiteCestasPerCapita = element;
          usaLimiteRendaPerCapita = element.usa;
          restringeRendaPerCapita = element.restringe;
          limiteRendaPerCapita = element.limite;
          break;
        default:
          break;
      }
    }
  }

  @action
  ConfigEntity getConfigLimiteCestas() {
    return ConfigEntity(
      id: configLimiteCestas?.id ?? '',
      descricao: 'usaLimiteCestas',
      mensagemErro: 'mensagemErro',
      usa: usaLimiteCestas ?? false,
      restringe: restringeLimiteCestas ?? false,
      limite: limiteCestas ?? 0,
    );
  }

  @action
  ConfigEntity getConfigLimiteRenda() {
    return ConfigEntity(
      id: configLimiteRend?.id ?? '',
      descricao: 'usaLimiteRenda',
      mensagemErro: 'mensagemErro',
      usa: usaLimiteRenda ?? false,
      restringe: restringeLimiteRenda ?? false,
      limite: limiteRenda ?? 0,
    );
  }

  @action
  ConfigEntity getConfigLimiteRendaPerCapita() {
    return ConfigEntity(
      id: configLimiteCestasPerCapita?.id ?? '',
      descricao: 'usaLimiteRendaPerCapita',
      mensagemErro: 'mensagemErro',
      usa: usaLimiteRendaPerCapita ?? false,
      restringe: restringeRendaPerCapita ?? false,
      limite: limiteRendaPerCapita ?? 0,
    );
  }
}
