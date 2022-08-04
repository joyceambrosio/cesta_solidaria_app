import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/widgets/charts/data/data_charts.dart';
import 'package:cartallum_app/src/core/shared/widgets/charts/tipos/bar_chart_app.dart';
import 'package:cartallum_app/src/core/shared/widgets/charts/tipos/stacked_horizontal_bar_chart.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart' as wdart;
import 'package:screenshot/screenshot.dart';

class EstatisticasCestasComponente implements Componente {
  final List<FamiliaEntity> listaFamilia;

  EstatisticasCestasComponente({
    required this.listaFamilia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    //  int familias = 0;

    // double cestasRecebidas = 0;
    // double cestasDivergentes = 0;

    Map<String, int> mesesRecebidosCestas = {};
    Map<String, int> bairrosCestas = {};

    Map<String, int> mesesDivergentesCestas = {};
    Map<String, int> bairrosDivergentesCestas = {};

    for (FamiliaEntity familia in listaFamilia) {
      // familias++;

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

    // Map<String, int> mesesRecebidosCestas = {};
    // Map<String, int> bairrosCestas = {};

    // Map<String, int> mesesDivergentesCestas = {};
    // Map<String, int> bairrosDivergentesCestas = {};
    final dataMesesRecebidos =
        _createDataListFromMaps('Meses Atendidos', mesesRecebidosCestas);
    final dataBairrosAtendidos =
        _createDataListFromMaps('Bairros Atendidos', bairrosCestas);
    final dataMesesCestasDivergentes = _createDataListFromMaps(
        'Cestas com alguma irregularidade', mesesDivergentesCestas);
    final dataBairrosBairrosDivergentes = _createDataListFromMaps(
        'Bairros atendidos com cestas com alguma irregularidade ',
        bairrosDivergentesCestas);

    return [
      ComponentesPdf.h2('Cestas e atendimento'),
      await createChartBar([dataMesesRecebidos]),
      // ComponentesPdf.h2('Bairros antedidos'),
      await createChartBar([dataBairrosAtendidos]),
      // ComponentesPdf.h2('Meses com cestas divergentes'),
      await createChartBar([dataMesesCestasDivergentes]),
      // ComponentesPdf.h2('Bairros com cestas divergentes'),
      await createChartBar([dataBairrosBairrosDivergentes]),
    ];
  }

  createChart(List<charts.Series<dynamic, String>> seriesList) async {
    ScreenshotController screenshotController = ScreenshotController();
    final bytes = await screenshotController.captureFromWidget(
      chart(
        seriesList,
      ),
    );
    return Expanded(child: Image(MemoryImage(bytes)));
  }

  createChartBar(List<charts.Series<dynamic, String>> seriesList) async {
    ScreenshotController screenshotController = ScreenshotController();
    final bytes = await screenshotController.captureFromWidget(
      chartBar(
        seriesList,
      ),
    );
    return Expanded(child: Image(MemoryImage(bytes)));
  }

  charts.Series<dynamic, String> _createDataListFromMaps(
    String id,
    Map<String, int> mapData,
  ) {
    List<Data> data = [];

    mapData.forEach((key, value) {
      data.add(Data(
        name: key,
        y: value * 1,
        color: Cores.corPrincipal,
      ));
    });

    data = List.from(data.reversed);
    return charts.Series<Data, String>(
        id: id,
        domainFn: (Data mapDatas, _) => mapDatas.name,
        measureFn: (Data mapDatas, _) => mapDatas.y,
        data: data,
        labelAccessorFn: (Data mapDatas, _) => '');
  }

  // charts.Series<dynamic, String> _createDataList(
  //   String id,
  //   List<int> dadosCrus,
  // ) {
  //   List<Data> data = [];

  //   for (int i = 0; i < dadosCrus.length; i++) {
  //     String label = '${5 * i} - ${(5 * i) + (5 - 1)}';
  //     data.add(Data(
  //       name: label,
  //       y: dadosCrus[i] * 1,
  //       color: Cores.corPrincipal,
  //     ));
  //   }
  //   data = List.from(data.reversed);
  //   return charts.Series<Data, String>(
  //       id: id,
  //       domainFn: (Data idades, _) => idades.name,
  //       measureFn: (Data idades, _) => idades.y,
  //       data: data,
  //       labelAccessorFn: (Data sales, _) => '');
  // }

  // SimpleBarChart

  wdart.Widget chartBar(List<charts.Series<dynamic, String>> seriesList) {
    return wdart.Container(
      padding: const wdart.EdgeInsets.all(10),
      child: wdart.MediaQuery(
        data: const wdart.MediaQueryData(),
        child: SimpleBarChart(
          seriesList: seriesList,
          animate: false,
        ),
      ),
    );
  }

  wdart.Widget chart(List<charts.Series<dynamic, String>> seriesList) {
    return wdart.Container(
      padding: const wdart.EdgeInsets.all(10),
      child: wdart.MediaQuery(
        data: const wdart.MediaQueryData(),
        child: StackedHorizontalBarChart(
          seriesList: seriesList,
          animate: false,
        ),
      ),
    );
  }
}
