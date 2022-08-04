import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class TabelaGrupoFamiliarComponente implements Componente {
  final FamiliaEntity familia;

  TabelaGrupoFamiliarComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return [
      ...createIntegrantes(familia),
    ];
  }

  createIntegrantes(FamiliaEntity familia) {
    List<Widget> listaTabelas = [];

    if (familia.integrantes != null) {
      if (familia.integrantes!.isNotEmpty) {
        listaTabelas.add(ComponentesPdf.h3('Familiares'));
        listaTabelas.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ComponentesPdf.createTableIntegrantes(
                  familia.integrantes!,
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
