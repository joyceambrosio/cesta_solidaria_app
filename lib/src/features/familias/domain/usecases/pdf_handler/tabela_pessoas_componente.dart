import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class TabelaPessoasComponente implements Componente {
  final List<FamiliaEntity> listaFamilia;

  TabelaPessoasComponente({
    required this.listaFamilia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return createIntegrantes(listaFamilia);
  }

  createIntegrantes(List<FamiliaEntity> lista) {
    List<Widget> listaTabelas = [];

    for (FamiliaEntity familia in lista) {
      if (familia.integrantes != null) {
        if (familia.integrantes!.isNotEmpty) {
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
    }
    return listaTabelas;
  }
}
