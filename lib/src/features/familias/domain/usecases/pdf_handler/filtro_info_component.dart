import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class FiltroInfoComponente implements Componente {
  final Map<String, dynamic> queryParams;

  FiltroInfoComponente({
    required this.queryParams,
  });

  @override
  Future<List<Widget>> getChildren() async {
    List<Widget> child = [createTabela(queryParams)];
    return child;
  }

  createTabela(Map<String, dynamic> queryParams) {
    if (queryParams.isEmpty) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filtros aplicados ao relatório',
              style: const TextStyle(fontSize: 14)),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'renda[gte]',
            'Renda inicial',
            formatter: FormatterApp.tryFormatMonetario,
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'renda[lte]',
            'Renda final',
            formatter: FormatterApp.tryFormatMonetario,
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'idade[lte]',
            'Idade inicial',
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'idade[gte]',
            'Idade final',
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'pessoasCount[lte]',
            'Limite de pessoas',
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'numeroCriancas[lte]',
            'Limite de crianças',
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'cestasComDisparidade',
            'Cestas com disparidade',
            altValue: 'Sim',
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'cestasCount[lte]',
            'Número de cestas inicial',
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'cestasCount[gte]',
            'Número de cestas final',
          ),
          ComponentesPdf.createRowQueryParams(
            queryParams,
            'mesesSemReceberCestas[gte]',
            'Meses sem receber cestas',
          ),
        ],
      ),
    );
  }

  // _getRow(Map<String, dynamic> queryParams, String key, String label) {
  //   if (queryParams.containsKey(key)) {
  //     return Container(
  //         padding: const EdgeInsets.only(
  //           left: 10,
  //           right: 10,
  //           top: 5,
  //           bottom: 5,
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(label),
  //                 ]),
  //             Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   Text(queryParams[key].toString()),
  //                 ])
  //           ],
  //         ));
  //   } else {
  //     return SizedBox();
  //   }
  // }
}
