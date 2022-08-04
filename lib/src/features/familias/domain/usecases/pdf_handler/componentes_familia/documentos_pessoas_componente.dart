import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class DocumentosPessoasComponente implements Componente {
  final FamiliaEntity familia;

  DocumentosPessoasComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    final comprovantesPessoas = await createComprovantesPessoas(familia);
    return [...comprovantesPessoas];
  }

  createComprovantesPessoas(FamiliaEntity familia) async {
    List<Widget> listaComprovantePessoas = [];

    if (familia.integrantes != null) {
      if (familia.integrantes!.isNotEmpty) {
        listaComprovantePessoas.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: await ComponentesPdf.createDocumentoPessoas(
                familia.integrantes!,
              ),
            ),
          ),
        );
      }
    }
    return listaComprovantePessoas;
  }
}
