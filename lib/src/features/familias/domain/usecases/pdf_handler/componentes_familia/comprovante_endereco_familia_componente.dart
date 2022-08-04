import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class ComprovanteEnderecoFamiliaComponente implements Componente {
  final FamiliaEntity familia;

  ComprovanteEnderecoFamiliaComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    final comprovanteEndereco = await createComprovanteEndereco(familia);

    return [...comprovanteEndereco];
  }

  createComprovanteEndereco(FamiliaEntity familia) async {
    List<Widget> listaComprovanteEndereco = [];

    listaComprovanteEndereco.add(
      Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: await ComponentesPdf.createComprovanteEndereco(
            familia,
          ),
        ),
      ),
    );

    return listaComprovanteEndereco;
  }
}
