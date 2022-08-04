import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';

import 'package:pdf/widgets.dart';

class TabelaMembrosComponente implements Componente {
  final InstituicaoEntity instituicao;

  TabelaMembrosComponente({
    required this.instituicao,
  });

  @override
  Future<List<Widget>> getChildren() async {
    List<Widget> children = [];
    children = [
      ComponentesPdf.h2('Membros da instituição'),
      ...createMembros(instituicao),
    ];
    return children;
  }

  createMembros(InstituicaoEntity instituicao) {
    List<Widget> listaTabelas = [];

    if (instituicao.membros != null) {
      if (instituicao.membros != null) {
        listaTabelas.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ComponentesPdf.createTableMembros(
                  instituicao.usuarios!,
                  instituicao.membros!,
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
