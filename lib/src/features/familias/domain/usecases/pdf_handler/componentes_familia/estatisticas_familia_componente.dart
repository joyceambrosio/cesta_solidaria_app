import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';

import 'package:pdf/widgets.dart';

class EstatisticasComponente implements Componente {
  final List<FamiliaEntity> listaFamilia;

  EstatisticasComponente({
    required this.listaFamilia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return createIntegrantes(listaFamilia);
  }

  createIntegrantes(List<FamiliaEntity> lista) {
    List<Widget> listaTabelas = [];

    Map<String, int> mesesRecebidosCestas = {};
    Map<String, int> bairrosCestas = {};

    Map<String, int> mesesDivergentesCestas = {};
    Map<String, int> bairrosDivergentesCestas = {};

    for (FamiliaEntity familia in lista) {
      if (familia.cestas != null) {
        for (CestaEntity cesta in familia.cestas!) {
          String chave = '${cesta.criadoEm.month}/${cesta.criadoEm.year}';

          if (mesesRecebidosCestas.containsKey(chave)) {
            mesesRecebidosCestas[chave] = mesesRecebidosCestas[chave]! + 1;
          } else {
            mesesRecebidosCestas[chave] = 1;
          }

          if (familia.endereco != null) {
            if (familia.endereco!.bairro.isNotEmpty) {
              String bairro = familia.endereco!.bairro;
              if (bairrosCestas.containsKey(bairro)) {
                bairrosCestas[bairro] = bairrosCestas[bairro]! + 1;
              } else {
                bairrosCestas[bairro] = 1;
              }
            }
          }

          if (cesta.divergente) {
            String chave = '${cesta.criadoEm.month}/${cesta.criadoEm.year}';

            if (mesesDivergentesCestas.containsKey(chave)) {
              mesesDivergentesCestas[chave] =
                  mesesDivergentesCestas[chave]! + 1;
            } else {
              mesesDivergentesCestas[chave] = 1;
            }

            if (familia.endereco != null) {
              if (familia.endereco!.bairro.isNotEmpty) {
                String bairro = familia.endereco!.bairro;
                if (bairrosDivergentesCestas.containsKey(bairro)) {
                  bairrosDivergentesCestas[bairro] =
                      bairrosDivergentesCestas[bairro]! + 1;
                } else {
                  bairrosDivergentesCestas[bairro] = 1;
                }
              }
            }
          }
        }
      }
    }
    return listaTabelas;
  }
}
