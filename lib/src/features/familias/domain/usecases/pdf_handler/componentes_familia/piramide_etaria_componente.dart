import 'package:cartallum_app/src/core/shared/widgets/charts/tipos/stacked_horizontal_bar_chart.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart' as wdart;
import 'package:pdf/widgets.dart';
import 'package:screenshot/screenshot.dart';

import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/widgets/charts/data/data_charts.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';

class PiramideEtariaComponente implements Componente {
  final List<FamiliaEntity> lista;

  PiramideEtariaComponente({
    required this.lista,
  });

  @override
  Future<List<Widget>> getChildren() async {
    var homens = List.filled(21, 0);
    var mulheres = List.filled(21, 0);
    var outros = List.filled(21, 0);

    for (FamiliaEntity familia in lista) {
      if (familia.integrantes != null) {
        if (familia.integrantes!.isNotEmpty) {
          for (PessoaEntity pessoa in familia.integrantes!) {
            if (pessoa.idade != null) {
              int indexIdade = (pessoa.idade! / 5).floor();

              switch (pessoa.sexo) {
                case 'm':
                  homens[indexIdade]++;
                  break;
                case 'f':
                  mulheres[indexIdade]++;
                  break;
                default:
                  outros[indexIdade]++;
                  break;
              }
            }
          }
        }
      }
    }

    final homensDC = _createDataList('Homens', homens);
    final mulheresDC = _createDataList('Mulheres', mulheres);
    final outrosDC = _createDataList('Outros', outros);

    return [
      ComponentesPdf.h2('Pirâmide etária'),
      await createChart([
        outrosDC,
        homensDC,
        mulheresDC,
      ])
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

  charts.Series<dynamic, String> _createDataList(
    String id,
    List<int> dadosCrus,
  ) {
    List<Data> data = [];

    for (int i = 0; i < dadosCrus.length; i++) {
      String label = '${5 * i} - ${(5 * i) + (5 - 1)}';
      data.add(Data(
        name: label,
        y: dadosCrus[i] * 1,
        color: Cores.corPrincipal,
      ));
    }
    data = List.from(data.reversed);
    return charts.Series<Data, String>(
        id: id,
        domainFn: (Data idades, _) => idades.name,
        measureFn: (Data idades, _) => idades.y,
        data: data,
        labelAccessorFn: (Data sales, _) => '');
  }
}
