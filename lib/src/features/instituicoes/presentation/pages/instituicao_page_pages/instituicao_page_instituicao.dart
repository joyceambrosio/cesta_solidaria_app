import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_page_stores/instituicao_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstituicaoPageInstituicao extends StatelessWidget {
  final InstituicaoEntity instituicao;
  final store = InstituicaoPageStore();
  final authStore = Modular.get<AuthStore>();
  final controller = Modular.get<InstituicaoController>();

  InstituicaoPageInstituicao({
    required this.instituicao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    store.setInstituicao(instituicao);

    Map<String, String> instituicaoMap = {
      "Nome": store.instituicao!.nome,
      "Sigla": store.instituicao!.sigla,
      "Cestas distibuidas (ultimo ano)": instituicao.cestasAno == null
          ? '0'
          : store.instituicao!.cestasAno.toString(),
      "Cestas distibuidas": instituicao.cestasTotal == null
          ? '0'
          : store.instituicao!.cestasTotal.toString(),
    };

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
            Container(
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
                children: [
                  Observer(builder: (_) {
                    return ListTile(
                      trailing: FaIcon(
                        store.instituicao!.verificado
                            ? Icons.verified
                            : Icons.pending,
                        color: store.instituicao!.verificado
                            ? Cores.success
                            : Cores.danger,
                        size: 20,
                      ),
                      title: Text(store.instituicao!.verificado
                          ? "Aprovada"
                          : "Pendnete de aprovação"),
                    );
                  }),
                ],
              ),
            ),
            if (authStore.isAdmin())
              Observer(builder: (_) {
                return ButtomField(
                  labelText: store.instituicao!.verificado
                      ? "Bloquear instituição"
                      : "Aprovar instituição",
                  background:
                      store.instituicao!.verificado ? Cores.danger : Cores.info,
                  onClick: () async {
                    final result = await showConfirmationDialog<int>(
                      context: context,
                      cancelLabel: "Cancelar",
                      title: store.instituicao!.verificado
                          ? "Bloquear instituição"
                          : "Aprovar instituição",
                      okLabel: store.instituicao!.verificado
                          ? "Bloquear"
                          : "Aprovar",
                      message: store.instituicao!.verificado
                          ? "Tem certeza disso? A instituição e seus membros perderão acesso às informações das famílias cadastradas e não poderão realizar novas doações"
                          : "Tem certeza disso? A instituição e seus membros terão acesso às informações de todas as famílias cadastradas",
                      actions: [
                        const AlertDialogAction(
                          key: 1,
                          label: "Sim",
                          isDestructiveAction: true,
                        ),
                      ],
                    );

                    if (result != null && result == 1) {
                      store.instituicao!.verificado =
                          !store.instituicao!.verificado;
                      InstituicaoEntity? instituicaoUpdate = await controller
                          .updateInstituicao(store.instituicao!);
                      if (instituicaoUpdate != null) {
                        store.instituicao = instituicaoUpdate;
                      }
                    }
                  },
                );
              }),
            Container(
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
              child: DescriptionList(
                informacoes: instituicaoMap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
