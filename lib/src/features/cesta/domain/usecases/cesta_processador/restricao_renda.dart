import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/storage/config_store.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/doacao_cesta_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RestricaoRenda extends DoacaoCestaHandler {
  @override
  Future<bool> processsar(FamiliaEntity familia, CestaEntity cesta) {
    final configStore = Modular.get<ConfigStore>();

    if (configStore.configLimiteRenda.usa) {
      String msg =
          'A renda da família ${FormatterApp.formatMonetario(familia.renda)} ultrapassa o limite (${FormatterApp.formatMonetario(configStore.configLimiteRenda.limite)}).';
      if (familia.renda >= configStore.configLimiteRenda.limite) {
        cesta.divergente = true;
        cesta.motivoDivergencia = cesta.motivoDivergencia + "\n" + msg;
        if (configStore.configLimiteRenda.restringe) {
          throw ErroApp(
            mensagem: msg,
          );
        }
      }
    }
    return verificaProximo(familia, cesta);
  }
}
