import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/storage/config_store.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/doacao_cesta_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestricaoNumeroCestasAnual extends DoacaoCestaHandler {
  @override
  Future<bool> processsar(FamiliaEntity familia, CestaEntity cesta) async {
    final configStore = Modular.get<ConfigStore>();

    if (configStore.configLimiteCestas.usa) {
      String msg =
          'A família já recebeu mais cestas do que o limite anual (${configStore.configLimiteCestas.limite}).';
      if (familia.cestasCount != null) {
        if (familia.cestasCount! >= configStore.configLimiteCestas.limite) {
          cesta.divergente = true;
          cesta.motivoDivergencia = cesta.motivoDivergencia + "\n" + msg;
          if (configStore.configLimiteCestas.restringe) {
            throw ErroApp(
              mensagem: msg,
            );
          }
        }
      }
    }
    return verificaProximo(familia, cesta);
  }
}
