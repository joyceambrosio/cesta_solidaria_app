import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';

class EnderecoFamiliarComponente implements Componente {
  final FamiliaEntity familia;

  EnderecoFamiliarComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    return [
      ...createEndereco(familia),
    ];
  }

  createEndereco(FamiliaEntity familia) {
    List<Widget> lista = [];
    if (familia.endereco != null) {
      String endereco = _getEndereco();
      if (endereco.isEmpty) return [];

      lista.add(ComponentesPdf.h2('Endereço'));
      lista.add(
        Container(
          decoration: BoxDecoration(color: PdfColor.fromHex('#F8F9FA')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                endereco,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }
    return lista;
  }

  _getEndereco() {
    String endereco = _textoEnd(
      valor: familia.endereco!.logradouro,
      pos: ', ',
    );
    endereco = _textoEnd(
      valor: familia.endereco!.numero,
      pre: endereco,
      quebra: true,
    );
    endereco = _textoEnd(
        valor: familia.endereco!.bairro,
        pre: endereco,
        pos: ' -',
        quebra: true);
    endereco = _textoEnd(
      valor: familia.endereco!.cep,
      pre: endereco,
      pos: ' -',
    );
    endereco = _textoEnd(
      valor: familia.endereco!.cidade,
      pre: endereco,
      pos: ' -',
    );
    endereco = _textoEnd(
      valor: familia.endereco!.estado,
      pre: endereco,
      quebra: true,
    );
    endereco = _textoEnd(
      valor: familia.endereco!.complemento,
      pre: endereco,
      quebra: true,
    );
    endereco = _textoEnd(
      valor: familia.endereco!.pontoReferencia,
      pre: endereco,
      quebra: true,
    );
    return endereco;
  }

  String _textoEnd(
      {String? valor,
      String pre = '',
      String pos = '',
      Function? formatter,
      bool quebra = false}) {
    if (valor == null) return '';
    if (valor.isEmpty) return '';
    if (formatter == null) {
      return '$pre $valor$pos' + (quebra ? '\n' : '');
    } else {
      return '$pre ${formatter(valor)}$pos' + (quebra ? '\n' : '');
    }
  }
}
