import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/instituicao_form_stepper_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/step_membros_store.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardMembro extends StatelessWidget {
  final UserAuthEntity membro;
  final InstituicaoController controller;
  final InstituicaoFormStepperStore store;
  final int index;

  const CardMembro({
    required this.controller,
    required this.store,
    required this.membro,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (store.instituicao == null) {
      return const SizedBox();
    }
    final MembroEntity membroRole = store.membrosStore.membros
        .where((element) => element.usuario.endsWith(membro.id))
        .first;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Tooltip(
                message: "Papel do membro",
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Chip(
                    backgroundColor:
                        membroRole.role == 'admin' ? Cores.info : Cores.warning,
                    avatar: Icon(
                      membroRole.role == 'admin'
                          ? Icons.admin_panel_settings_outlined
                          : Icons.emoji_people_sharp,
                      color: Cores.textColor,
                      size: 15,
                    ),
                    label: Text(
                      membroRole.role == 'admin' ? 'Administrador' : 'Usuário',
                      style: const TextStyle(
                        color: Cores.textColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              IconeBloquear(
                store: store.membrosStore,
                controller: controller,
                membro: membro,
                index: index,
                membroRole: membroRole,
              ),
            ],
          ),
          DescriptionList(
            informacoes: <String, String>{
              "Nome": membro.name,
              "Status": membroRole.active ? "Ativo" : "Inativo"
            },
          )
        ],
      ),
    );
  }
}

class IconeBloquear extends StatelessWidget {
  const IconeBloquear({
    Key? key,
    required this.store,
    required this.controller,
    required this.membro,
    required this.index,
    required this.membroRole,
  }) : super(key: key);

  final StepMembrosStore store;
  final InstituicaoController controller;
  final UserAuthEntity membro;
  final MembroEntity membroRole;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (store.getNumAdms() > 1 || membro.role == 'user') {
      if (membroRole.active) {
        return IconButton(
          onPressed: () async {
            final result = await showConfirmationDialog<int>(
              context: context,
              cancelLabel: "Cancelar",
              title: 'Desativar membro',
              okLabel: "Desativar",
              message: 'Tem certeza disso?',
              actions: [
                const AlertDialogAction(
                  key: 1,
                  label: "Sim",
                  isDestructiveAction: true,
                ),
              ],
            );

            if (result != null && result == 1 && store.instituicao != null) {
              membroRole.active = false;
              controller.membroController.updateMembro(
                store.instituicao!.id,
                membroRole,
              );
              store.setInstituicao(
                await controller.getInstituicao(store.instituicao!.id),
              );
              store.setUsersFiltro();
              store.setMembrosVisual();
            }
          },
          icon: const FaIcon(FontAwesomeIcons.unlock),
        );
      } else {
        return IconButton(
          onPressed: () async {
            final result = await showConfirmationDialog<int>(
              context: context,
              cancelLabel: "Cancelar",
              title: 'Ativar membro',
              okLabel: "Ativar",
              message:
                  'Tem certeza disso? O membro terá acesso às informações das famílias',
              actions: [
                const AlertDialogAction(
                  key: 1,
                  label: "Sim",
                  isDestructiveAction: true,
                ),
              ],
            );

            if (result != null && result == 1 && store.instituicao != null) {
              membroRole.active = true;
              controller.membroController.updateMembro(
                store.instituicao!.id,
                membroRole,
              );

              store.setInstituicao(
                  await controller.getInstituicao(store.instituicao!.id));
              store.setUsersFiltro();
              store.setMembrosVisual();
            }
          },
          icon: const FaIcon(FontAwesomeIcons.lock),
        );
      }
    } else {
      return const SizedBox();
    }
  }
}
