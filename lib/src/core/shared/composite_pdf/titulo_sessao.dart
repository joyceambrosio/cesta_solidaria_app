import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';
import 'package:pdf/widgets.dart';

class TituloSessao implements Componente {
  String titulo;

  TituloSessao({
    required this.titulo,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return [createCabecalho(titulo)];
  }

  createCabecalho(String titulo) {
    return ComponentesPdf.h2(titulo);
  }
}
