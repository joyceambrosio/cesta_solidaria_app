import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class TabelaAtividadesComponente implements Componente {
  final List<AtividadeEntity> atividades;

  TabelaAtividadesComponente({
    required this.atividades,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return [
      ...createTabela(atividades),
    ];
  }

  createTabela(List<AtividadeEntity> atividades) {
    List<Widget> listaTabelas = [];
    listaTabelas.add(ComponentesPdf.h3('Atividades'));
    listaTabelas.add(
      Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...ComponentesPdf.createTableAtividades(
              atividades,
            ),
          ],
        ),
      ),
    );

    return listaTabelas;
  }
}
