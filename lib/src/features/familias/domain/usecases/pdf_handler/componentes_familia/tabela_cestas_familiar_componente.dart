import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class TabelaCestasFamiliarComponente implements Componente {
  final FamiliaEntity familia;

  TabelaCestasFamiliarComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return [
      ...createCestas(familia),
    ];
  }

  static createCestas(FamiliaEntity familia) {
    List<Widget> listaTabelas = [];

    if (familia.cestas != null) {
      if (familia.cestas!.isNotEmpty) {
        listaTabelas.add(ComponentesPdf.h3('Cestas'));
        listaTabelas.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ComponentesPdf.createTableCestas(
                  familia.cestas!,
                ),
              ],
            ),
          ),
        );
      }
    }

    return listaTabelas;
  }
}
