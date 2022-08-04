import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class RendaFamiliarComponente implements Componente {
  final FamiliaEntity familia;

  RendaFamiliarComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return [...createIntegrantes(familia)];
  }

  createIntegrantes(FamiliaEntity familia) {
    List<Widget> listaComponentes = [];

    listaComponentes.add(ComponentesPdf.h3('Renda'));
    listaComponentes.add(ComponentesPdf.createRow(
      "Renda",
      FormatterApp.formatMonetario(familia.renda),
    ));
    listaComponentes.add(ComponentesPdf.createRow(
      "Renda per capita",
      FormatterApp.formatMonetario(familia.rendaPerCapita()),
    ));
    return listaComponentes;
  }
}
