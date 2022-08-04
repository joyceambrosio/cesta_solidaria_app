import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class ComprovanteRendaComponente implements Componente {
  final FamiliaEntity familia;

  ComprovanteRendaComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    final comprovanteRenda = await createComprovanteRenda(familia);
    return [...comprovanteRenda];
  }

  createComprovanteRenda(FamiliaEntity familia) async {
    List<Widget> listaComprovanteEndereco = [];

    if (familia.comprovanteRenda != null &&
        familia.dataComprovanteRenda != null) {
      if (familia.comprovanteRenda!.isNotEmpty) {
        listaComprovanteEndereco.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: await ComponentesPdf.createDocumentoRenda(
                familia,
              ),
            ),
          ),
        );
      }
    }
    return listaComprovanteEndereco;
  }
}
