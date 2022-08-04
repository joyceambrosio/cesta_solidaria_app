import 'dart:async';
import 'dart:collection';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class ComponentesPdf {
  // static createRendaHeadeer(FamiliaEntity familia) {}

  static createTableMembros(
    List<UserAuthEntity> users,
    List<MembroEntity> membros,
  ) {
    const tableHeaders = [
      'Nome',
      'Papel',
      'Data de entrada',
    ];

    List<List<dynamic>> tableData = [];

    for (UserAuthEntity user in users) {
      MembroEntity? membro;
      var aux = membros.where((element) => element.usuario == user.id);
      if (aux.isNotEmpty) {
        membro = aux.first;
      }
      tableData.add([
        user.name + (user.role == 'admin' ? '*' : ''),
        membro!.role == 'admin' ? "Administrador" : "Usuário",
        FormatterApp.fromatDate(membro.criadoEm)
      ]);
    }

    final tabela = Table.fromTextArray(
      cellStyle: const TextStyle(fontSize: 10),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerLeft,
      },
      cellPadding: const EdgeInsets.only(left: 5, bottom: 2, top: 2, right: 5),
      columnWidths: {
        0: const FractionColumnWidth(33),
        1: const FractionColumnWidth(33),
        2: const FractionColumnWidth(33),
      },
      headers: tableHeaders,
      data: tableData,
    );

    return tabela;
  }

  static createTabela(Map<String, int> lista, List<String> tableHeaders,
      {bool percernt = false}) {
    List<List<dynamic>> tableData = [];

    if (percernt) {
      tableHeaders.add('Percentual (%)');
      final sorted = SplayTreeMap<String, dynamic>.from(
        lista,
        (a, b) => a.compareTo(b),
      );
      double total = 0;

      sorted.forEach((key, value) {
        total += value * 1;
      });

      sorted.forEach((key, value) {
        tableData.add([
          key,
          value,
          FormatterApp.formatPercent(value / total),
        ]);
      });

      final tabela = Table.fromTextArray(
        cellStyle: const TextStyle(fontSize: 10),
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.center,
          2: Alignment.center,
        },
        cellPadding:
            const EdgeInsets.only(left: 5, bottom: 2, top: 2, right: 5),
        columnWidths: {
          0: const FractionColumnWidth(33),
          1: const FractionColumnWidth(33),
          2: const FractionColumnWidth(33),
        },
        headers: tableHeaders,
        data: tableData,
      );
      return tabela;
    } else {
      final sorted = SplayTreeMap<String, dynamic>.from(
        lista,
        (a, b) => a.compareTo(b),
      );

      sorted.forEach((key, value) {
        tableData.add([
          key,
          value,
        ]);
      });

      final tabela = Table.fromTextArray(
        cellStyle: const TextStyle(fontSize: 10),
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.center,
        },
        cellPadding:
            const EdgeInsets.only(left: 5, bottom: 2, top: 2, right: 5),
        columnWidths: {
          0: const FractionColumnWidth(30),
          1: const FractionColumnWidth(70),
        },
        headers: tableHeaders,
        data: tableData,
      );
      return tabela;
    }
  }

  static createTableIntegrantes(List<PessoaEntity> pessoas) {
    const tableHeaders = [
      'Nome',
      'Cpf',
      'Data Nasc.',
      'Idade',
      'Sexo',
      'Telefone'
    ];

    List<List<dynamic>> tableData = [];

    for (PessoaEntity pessoa in pessoas) {
      tableData.add([
        pessoa.nome + (pessoa.responsavel ? '*' : ''),
        FormatterApp.fromatCpf(pessoa.cpf ?? ''),
        FormatterApp.fromatDate(pessoa.dataNascimento),
        pessoa.idade,
        pessoa.sexo.toUpperCase(),
        pessoa.telefone
      ]);
    }

    final tabela = Table.fromTextArray(
      cellStyle: const TextStyle(fontSize: 10),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.center,
        5: Alignment.centerRight,
      },
      cellPadding: const EdgeInsets.only(left: 5, bottom: 2, top: 2, right: 5),
      columnWidths: {
        0: const FractionColumnWidth(30),
        1: const FractionColumnWidth(20),
        2: const FractionColumnWidth(20),
        3: const FractionColumnWidth(10),
        4: const FractionColumnWidth(10),
        5: const FractionColumnWidth(20),
      },
      headers: tableHeaders,
      data: tableData,
    );

    return tabela;
  }

  static createTableCestas(List<CestaEntity> cestas) {
    const tableHeaders = [
      'Data Hora',
      'Instituição',
      'Divergente',
      'Motivo',
      'Local',
    ];

    List<List<dynamic>> tableData = [];

    for (CestaEntity cesta in cestas) {
      tableData.add([
        FormatterApp.fromatDateHora(cesta.criadoEm),
        cesta.nomeInstituicao ?? cesta.instituicao,
        cesta.divergente ? 'Sim' : 'Não',
        cesta.motivoDivergencia,
        // cesta.local?.coordinates != null
        //     ? cesta.local!.coordinates.isEmpty
        //         ? ''
        //         : cesta.local!.coordinates
        //     : ''
      ]);
    }

    final tabela = Table.fromTextArray(
      cellStyle: const TextStyle(fontSize: 10),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerLeft,
        3: Alignment.centerLeft,
        // 4: Alignment.center,
        //https://www.google.com/maps/search/?api=1&query=47.5951518%2C-122.3316393
      },
      cellPadding: const EdgeInsets.only(left: 5, bottom: 2, top: 2, right: 5),
      columnWidths: {
        0: const FractionColumnWidth(15),
        1: const FractionColumnWidth(20),
        2: const FractionColumnWidth(10),
        3: const FractionColumnWidth(20),
        // 4: const FractionColumnWidth(10),
      },
      headers: tableHeaders,
      data: tableData,
    );

    return tabela;
  }

  static Future createDocumentoRenda(FamiliaEntity familia) async {
    List<Widget> fotos = [];

    fotos.add(await createFoto(
      'Comprovante de renda',
      familia.comprovanteRenda!,
      familia.dataComprovanteRenda!,
    ));

    return fotos;
  }

  static Future createDocumentoPessoas(List<PessoaEntity> pessoas) async {
    List<Widget> fotos = [];

    if (pessoas.isEmpty) return fotos;

    for (PessoaEntity pessoa in pessoas) {
      if (pessoa.comprovante != null) {
        if (pessoa.comprovante!.isNotEmpty) {
          fotos.add(await createFoto(
            pessoa.nome,
            pessoa.comprovante!,
            pessoa.dataComprovante!,
          ));
        }
      }
    }
    return fotos;
  }

  static Future createComprovanteEndereco(FamiliaEntity familia) async {
    List<Widget> fotos = [];

    if (familia.comprovanteEndereco != null &&
        familia.dataComprovanteEndereco != null) {
      fotos.add(await createFoto(
        'Comprovante de Endereço',
        familia.comprovanteEndereco!,
        familia.dataComprovanteEndereco!,
      ));
    }

    return fotos;
  }

  static Future<Widget> createFoto(
    String titulo,
    String url,
    DateTime timestamp,
  ) async {
    final netImage = await networkImage(
      url,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titulo),
        Image(netImage),
        Text(FormatterApp.fromatDateHora(timestamp))
      ],
    );
  }

  static createRowQueryParams(
    Map<String, dynamic> queryParams,
    String key,
    String label, {
    String? altValue,
    Function? formatter,
  }) {
    if (queryParams.containsKey(key)) {
      if (altValue != null) {
        return createRow(label, altValue);
      }
      String displayValue = queryParams[key].toString();
      if (formatter != null) displayValue = formatter(queryParams[key]);
      return createRow(label, displayValue);
    } else {
      return SizedBox();
    }
  }

  static h1(String title, {PdfColor? textColor, PdfColor? backgroundColor}) {
    return Container(
      color: backgroundColor ?? PdfColor.fromHex('#FF4F5A'),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: textColor ?? PdfColor.fromHex('#FFFFFF')),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  static h2(String title, {PdfColor? textColor, PdfColor? backgroundColor}) {
    return Container(
      color: backgroundColor ?? PdfColor.fromHex('#A7A7A7'),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: textColor ?? PdfColor.fromHex('#181819')),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  static h3(String title, {PdfColor? textColor, PdfColor? backgroundColor}) {
    return Container(
      color: backgroundColor ?? PdfColor.fromHex('#FFFFFF'),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: textColor ?? PdfColor.fromHex('#FF4F5A')),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  static createRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
              ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value),
              ])
        ],
      ),
    );
  }

  static createTableAtividades(List<AtividadeEntity> atividades) {
    int pageSize = 15;
    int i = 0;
    bool hasNext = true;

    List<dynamic> tabelas = [];

    while (hasNext) {
      if (i + pageSize > atividades.length) {
        pageSize = atividades.length - i;
      }
      tabelas.add(_createTableAtividades(
        atividades.sublist(i, i + pageSize - 1),
      ));

      i = i + pageSize;

      if (i >= atividades.length) {
        hasNext = false;
      }
    }
    return tabelas;
  }

  static _createTableAtividades(List<AtividadeEntity> atividades) {
    const tableHeaders = [
      'Data',
      'Instituição',
      'Usuário',
      'Atividade',
    ];

    List<List<dynamic>> tableData = [];

    for (AtividadeEntity atividade in atividades) {
      tableData.add([
        FormatterApp.fromatDateHora(atividade.criadoEm),
        atividade.nomeInstituicao ?? '',
        atividade.nomeUsuario ?? '',
        atividade.mensagem,
      ]);
    }

    final tabela = Table.fromTextArray(
      cellStyle: const TextStyle(fontSize: 10),
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.centerLeft,
        3: Alignment.centerLeft,
      },
      cellPadding: const EdgeInsets.only(left: 5, bottom: 2, top: 2, right: 5),
      columnWidths: {
        0: const FractionColumnWidth(15),
        1: const FractionColumnWidth(15),
        2: const FractionColumnWidth(20),
        3: const FractionColumnWidth(50),
      },
      headers: tableHeaders,
      data: tableData,
    );

    return tabela;
  }
}
