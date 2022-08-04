import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';

import 'package:pdf/widgets.dart';

class InstituicaoComponente implements Componente {
  final InstituicaoEntity instituicao;

  InstituicaoComponente({
    required this.instituicao,
  });

  @override
  Future<List<Widget>> getChildren() async {
    List<Widget> children = [];

    children = [
      ...create(instituicao),
    ];
    return children;
  }

  create(InstituicaoEntity instituicao) {
    List<Widget> listaComponentes = [];
    listaComponentes.add(ComponentesPdf.h1(
      '${instituicao.nome} ${instituicao.sigla.isEmpty ? '' : '-'} ${instituicao.sigla}',
    ));
    listaComponentes.add(ComponentesPdf.createRow(
      "Telefone",
      instituicao.telefone,
    ));

    return listaComponentes;
  }
}
