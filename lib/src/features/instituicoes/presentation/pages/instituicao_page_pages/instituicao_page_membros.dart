import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_page_stores/instituicao_page_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/widgets/card_membro_page.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstituicaoPageMembros extends StatelessWidget {
  final InstituicaoEntity instituicao;
  final InstituicaoController controller;
  final InstituicaoPageStore store;

  const InstituicaoPageMembros({
    required this.instituicao,
    required this.controller,
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Modular.get<AuthStore>();
    if (instituicao.membros == null) {
      if (instituicao.membros!.isEmpty) {
        return const SizedBox();
      }
    }
    List<MembroEntity> membros = instituicao.membros!;
    return SingleChildScrollView(
      child: Container(
        padding: Utils.paddingPadrao,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            if (!authStore.isOnInstituicao(instituicao.id))
              Observer(builder: (_) {
                return ButtomField(
                  icone: store.isLoadingConvite
                      ? const FaIcon(
                          FontAwesomeIcons.spinner,
                          size: 15,
                        )
                      : null,
                  labelText: 'Requisitar Convite',
                  background: Cores.info,
                  onClick: () async {
                    store.isLoadingConvite = true;
                    UserAuthEntity user = await authStore.getUser();
                    MembroEntity? convite = MembroEntity(
                      id: '',
                      role: 'user',
                      active: false,
                      instituicao: instituicao.id,
                      usuario: user.id,
                      criadoEm: DateTime.now(),
                    );

                    convite = await controller.membroController.addMembro(
                      instituicao.id,
                      convite,
                    );

                    if (convite != null) {
                      store.isLoadingConvite = false;
                      SnackApp.sucess(
                          'Convite requisitado com sucesso. Aguarde a aprovação de um administrador');
                      store.instituicao!.membros!.add(convite);
                      store.membrosLenght++;
                    } else {
                      SnackApp.error(
                          'Houve um erro ao requisitar o convite. Você pode tentar mais tarde ou requisitar a adição manual a um administrador da instituição.');
                    }
                    store.isLoadingConvite = false;
                  },
                );
              }),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: store.membrosLenght,
                itemBuilder: (context, index) {
                  return CardMembroPage(
                    membro: membros[index],
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
