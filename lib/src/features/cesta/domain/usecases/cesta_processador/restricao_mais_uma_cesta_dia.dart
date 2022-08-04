import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/doacao_cesta_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';

class RestricaoMaisUmaCestaDia extends DoacaoCestaHandler {
  @override
  Future<bool> processsar(FamiliaEntity familia, CestaEntity cesta) async {
    if (familia.cestas != null) {
      if (familia.cestas!.isNotEmpty) {
        CestaEntity ultimaCesta = familia.cestas!.first;

        Duration dur = DateTime.now().difference(ultimaCesta.criadoEm);
        int differenceInDays = (dur.inDays).floor();
        String msg =
            'A última cesta recebida foi ${getData(differenceInDays, ultimaCesta.criadoEm)}.';

        if (differenceInDays <= 30) {
          cesta.divergente = true;
          cesta.motivoDivergencia = cesta.motivoDivergencia + "\n" + msg;
        }
      }
    }

    return verificaProximo(familia, cesta);
  }

  getData(int diferenca, DateTime ultimaCesta) {
    switch (diferenca) {
      case 0:
        return 'hoje, dia ${FormatterApp.fromatDate(ultimaCesta)}';
      case 1:
        return 'ontem, dia ${FormatterApp.fromatDate(ultimaCesta)}';
      default:
        return 'no dia ${FormatterApp.fromatDate(ultimaCesta)} ($diferenca dias atrás)';
    }
  }
}
