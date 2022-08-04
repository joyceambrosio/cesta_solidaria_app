import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionList extends StatelessWidget {
  final String titulo;
  final Map<String, String>? informacoes;
  const DescriptionList({
    this.titulo = "",
    this.informacoes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TableRow> list = [];

    if (informacoes != null) {
      informacoes!.removeWhere((dynamic key, dynamic value) =>
          key == null || value == null || value == '');

      informacoes!.forEach((key, value) => list.add(cell(key, value)));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (titulo.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                titulo,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Cores.corPrincipal,
                ),
              ),
            ),
          Table(
            border: TableBorder.all(
              borderRadius: BorderRadius.zero,
              style: BorderStyle.none,
              width: 0,
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(0.8),
              1: FlexColumnWidth(1),
            },
            children: list,
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  TableRow cell(String legenda, String dado) {
    if (legenda.isEmpty) {
      return TableRow(
        children: <Widget>[
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                dado,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Cores.dark,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return TableRow(
        children: <Widget>[
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                legenda,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Cores.dark,
                ),
              ),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                dado,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Cores.dark,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
