import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:flutter/material.dart';

class PessoaHomeListTile extends StatelessWidget {
  final PessoaEntity pessoa;
  final bool isExibeDependente;

  const PessoaHomeListTile({
    required this.pessoa,
    required this.isExibeDependente,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!pessoa.responsavel && !isExibeDependente) {
      return const SizedBox();
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              pessoa.nome,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Cores.dark,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            FormatterApp.fromatCpfPrivate(pessoa.cpf ?? ''),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Cores.dark,
            ),
          ),
        ),
      ],
    );
  }
}
