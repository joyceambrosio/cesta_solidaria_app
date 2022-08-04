import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/widgets/componentes_pdf.dart';

import 'package:pdf/widgets.dart';

class FamiliaComponente implements Componente {
  final FamiliaEntity familia;

  FamiliaComponente({
    required this.familia,
  });

  @override
  Future<List<Widget>> getChildren() async {
    List<Widget> children = [];
    final comprovanteRenda = await createComprovanteRenda(familia);
    final comprovanteEndereco = await createComprovanteEndereco(familia);
    final comprovantesPessoas = await createComprovantesPessoas(familia);
    children = [
      ComponentesPdf.h3('Renda'),
      ComponentesPdf.createRow(
        "Renda",
        FormatterApp.formatMonetario(familia.renda),
      ),
      ComponentesPdf.createRow("Renda per capita",
          FormatterApp.formatMonetario(familia.rendaPerCapita())),
      ComponentesPdf.h3('Família'),
      ...createIntegrantes(familia),
      ComponentesPdf.h3('Cestas'),
      ...createCestas(familia),
      ...comprovanteRenda,
      ...comprovanteEndereco,
      ...comprovantesPessoas,
    ];
    return children;
  }

  createIntegrantes(FamiliaEntity familia) {
    List<Widget> listaTabelas = [];

    if (familia.integrantes != null) {
      if (familia.integrantes!.isNotEmpty) {
        listaTabelas.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ComponentesPdf.createTableIntegrantes(
                  familia.integrantes!,
                ),
              ],
            ),
          ),
        );
      }
    }
    return listaTabelas;
  }

  createComprovantesPessoas(FamiliaEntity familia) async {
    List<Widget> listaComprovantePessoas = [];

    if (familia.integrantes != null) {
      if (familia.integrantes!.isNotEmpty) {
        listaComprovantePessoas.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: await ComponentesPdf.createDocumentoPessoas(
                familia.integrantes!,
              ),
            ),
          ),
        );
      }
    }
    return listaComprovantePessoas;
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

  static createCestas(FamiliaEntity familia) {
    List<Widget> listaTabelas = [];

    if (familia.cestas != null) {
      if (familia.cestas!.isNotEmpty) {
        listaTabelas.add(
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ComponentesPdf.createTableCestas(
                  familia.cestas!,
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
