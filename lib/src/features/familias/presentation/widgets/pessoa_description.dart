import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PessoaDescription extends StatelessWidget {
  final PessoaEntity pessoa;
  final bool isExibeDependente;

  const PessoaDescription({
    required this.pessoa,
    required this.isExibeDependente,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!pessoa.responsavel && !isExibeDependente) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isExibeDependente)
              Tooltip(
                message: "Papel do familiar",
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Chip(
                    backgroundColor:
                        pessoa.responsavel ? Cores.info : Cores.light,
                    avatar: Icon(
                      pessoa.responsavel
                          ? Icons.face_retouching_natural_sharp
                          : Icons.face,
                      color: pessoa.responsavel ? Cores.light : Cores.textColor,
                      size: 15,
                    ),
                    label: Text(
                      pessoa.responsavel ? 'Responsável' : 'Familiar',
                      style: TextStyle(
                        color:
                            pessoa.responsavel ? Cores.light : Cores.textColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            Tooltip(
              message: "Idade",
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Chip(
                  backgroundColor:
                      (pessoa.idade! >= 18) ? Cores.info : Cores.success,
                  avatar: const FaIcon(
                    FontAwesomeIcons.calendar,
                    color: Cores.textColor,
                    size: 15,
                  ),
                  label: Text(
                    (pessoa.idade! >= 18)
                        ? 'Adulto ${pessoa.idade}'
                        : 'Dependente ${pessoa.idade}',
                    style: const TextStyle(
                      color: Cores.textColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            // Tooltip(
            //   message: "Sexo",
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 0, right: 0),
            //     child: Chip(
            //       backgroundColor:
            //           (pessoa.idade! >= 18) ? Cores.info : Cores.success,
            //       avatar: FaIcon(
            //         pessoa.sexo == 'f'
            //             ? FontAwesomeIcons.personDress
            //             : FontAwesomeIcons.person,
            //         color: Cores.textColor,
            //         size: 15,
            //       ),
            //       label: Text(
            //         (pessoa.sexo == 'f') ? 'Mulher' : 'Homem',
            //         style: const TextStyle(
            //           color: Cores.textColor,
            //           fontSize: 12,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        DescriptionList(informacoes: <String, String>{
          'Nome': pessoa.nome,
          'Cpf': (pessoa.idade! >= 18)
              ? FormatterApp.fromatCpfPrivate(pessoa.cpf ?? '')
              : '',
          'Data de Nascimento':
              DateFormat('dd/MM/yyyy').format(pessoa.dataNascimento),
          'Idade': '${pessoa.idade} anos',
          'Sexo': pessoa.sexo == 'f'
              ? "Feminino"
              : pessoa.sexo == 'm'
                  ? 'Masculino'
                  : 'Outro',
          'Telefone': pessoa.telefone ?? ''
        })
      ],
    );
  }
}
