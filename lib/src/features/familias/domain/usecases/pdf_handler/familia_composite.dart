import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componente_composite.dart';

import 'package:pdf/widgets.dart';

class FamiliaComposite extends ComponenteComposite {
  @override
  Future<List<Widget>> getChildren() async {
    List<Widget> lista = [];
    for (var parteDoc in componentes) {
      lista = [
        ...lista,
        ...await parteDoc.getChildren(),
      ];
    }
    return lista;
  }
}
