import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/image_collapse_shareable.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_form_stepper_pages_store/step_pessoas_store.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PessoaListTile extends StatelessWidget {
  final FamiliaController controller;
  final PessoaEntity pessoa;
  final StepPessoasStore store;
  final int index;

  const PessoaListTile({
    required this.controller,
    required this.pessoa,
    required this.store,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          Shadows.muitoLeve(),
        ],
        borderRadius: Utils.arredondamentoPadrao,
        color: Cores.white,
      ),
      width: double.infinity,
      margin: Utils.marginPadrao,
      padding: Utils.paddingPadrao,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      final result = await showConfirmationDialog<int>(
                        context: context,
                        cancelLabel: "Cancelar",
                        title: 'Remover familiar',
                        okLabel: "Remover",
                        message:
                            'Tem certeza disso? A ação não poderá ser desfeita',
                        actions: [
                          const AlertDialogAction(
                            key: 1,
                            label: "Sim",
                            isDestructiveAction: true,
                          ),
                        ],
                      );

                      if (result != null && result == 1) {
                        controller.pessoaController.removerPessoa(
                          store.familia!.id,
                          pessoa.id,
                        );
                        store.removePessoasAt(index);
                        store.removePessoas(pessoa);
                      }
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.pencil,
                      size: 20,
                    ),
                    onPressed: () {
                      store.setPessoa(pessoa);
                    },
                  ),
                ],
              )
            ],
          ),
          DescriptionList(informacoes: <String, String>{
            'Nome': pessoa.nome,
            'Cpf': MagicMask.buildMask('999.999.999-99')
                .getMaskedString(pessoa.cpf ?? ''),
            'Data de Nascimento': DateFormat('dd/MM/yyyy').format(
              pessoa.dataNascimento,
            ),
            'Sexo': pessoa.sexo == 'm'
                ? "Masculino"
                : pessoa.sexo == 'f'
                    ? "Feminino"
                    : "Outro",
            'Telefone': pessoa.telefone ?? ''
          }),
          (pessoa.comprovante == null)
              ? const SizedBox()
              : (pessoa.comprovante!.isEmpty)
                  ? const SizedBox()
                  : ImageCollapseShareable(
                      imageUrl: pessoa.comprovante!,
                      title: "Documento",
                    )
        ],
      ),
    );
  }
}
