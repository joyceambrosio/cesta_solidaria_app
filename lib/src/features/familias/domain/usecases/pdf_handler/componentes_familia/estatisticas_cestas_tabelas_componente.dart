import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class EstatisticasCestasTabelasComponente implements Componente {
  final List<FamiliaEntity> listaFamilia;

  EstatisticasCestasTabelasComponente({
    required this.listaFamilia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    // int familias = 0;

    // double cestasRecebidas = 0;
    // double cestasDivergentes = 0;

    Map<String, int> mesesRecebidosCestas = {};
    Map<String, int> bairrosCestas = {};

    Map<String, int> mesesDivergentesCestas = {};
    Map<String, int> bairrosDivergentesCestas = {};

    for (FamiliaEntity familia in listaFamilia) {
      if (familia.cestas != null) {
        // cestasRecebidas += familia.cestas!.length;
        for (CestaEntity cesta in familia.cestas!) {
          // cestasDivergentes++;
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
            // cestasDivergentes++;
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

    return [
      ComponentesPdf.h2('Informações sobre distribuição de cestas'),
      ComponentesPdf.h3('Cestas e atendimento'),
      await createTabela(
        mesesRecebidosCestas,
        ['Data', 'Cestas distribuídas'],
        true,
      ),
      ComponentesPdf.h3('Meses com cestas irregulares'),
      await createTabela(
        mesesDivergentesCestas,
        ['Data', 'Quantidade cestas irregulares'],
        true,
      ),
      ComponentesPdf.h3('Bairros antedidos'),
      await createTabela(
        bairrosCestas,
        ['Bairro', 'Cestas distribuídas'],
        true,
      ),
      ComponentesPdf.h3('Bairros atendidos com cestas irregulares'),
      await createTabela(
        bairrosDivergentesCestas,
        ['Bairro', 'Quantidade cestas com irregularidades'],
        true,
      ),
    ];
  }

  createTabela(
    Map<String, int> lista,
    List<String> tableHeaders,
    bool percernt,
  ) async {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          await ComponentesPdf.createTabela(
            lista,
            tableHeaders,
            percernt: percernt,
          ),
        ],
      ),
    );
  }
}
