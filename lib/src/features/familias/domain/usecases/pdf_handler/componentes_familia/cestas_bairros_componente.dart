import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';

import 'package:pdf/widgets.dart';

class CestasBairrosComponente implements Componente {
  final List<CestaEntity> listaCestas;

  CestasBairrosComponente({
    required this.listaCestas,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return create(listaCestas);
  }

  create(List<CestaEntity> listaCestas) {
    List<Widget> listaTabelas = [];
    Map<String, int> mesesRecebidosCestas = {};

    Map<String, int> mesesDivergentesCestas = {};

    for (CestaEntity cesta in listaCestas) {
      String chave = '${cesta.criadoEm.month}/${cesta.criadoEm.year}';

      if (mesesRecebidosCestas.containsKey(chave)) {
        mesesRecebidosCestas[chave] = mesesRecebidosCestas[chave]! + 1;
      } else {
        mesesRecebidosCestas[chave] = 1;
      }

      if (cesta.divergente) {
        String chave = '${cesta.criadoEm.month}/${cesta.criadoEm.year}';

        if (mesesDivergentesCestas.containsKey(chave)) {
          mesesDivergentesCestas[chave] = mesesDivergentesCestas[chave]! + 1;
        } else {
          mesesDivergentesCestas[chave] = 1;
        }
      }
    }
    return listaTabelas;
  }
}
