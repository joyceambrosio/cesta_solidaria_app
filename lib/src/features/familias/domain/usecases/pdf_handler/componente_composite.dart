import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
// ignore: implementation_imports
import 'package:pdf/src/widgets/widget.dart';

class ComponenteComposite implements Componente {
  Set<Componente> componentes = {};

  void add(Componente child) {
    componentes.add(child);
  }

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
