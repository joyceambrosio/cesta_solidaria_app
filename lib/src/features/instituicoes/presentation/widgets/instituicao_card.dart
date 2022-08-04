import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/mixins/alert_dialog_app.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicoes_home_store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardInstituicao extends StatelessWidget with AlertDialogApp {
  final InstituicaoController controller;
  final InstituicaoEntity instituicao;
  final InstituicoesHomeStore store;
  final VoidCallback callback;

  const CardInstituicao({
    required this.controller,
    required this.instituicao,
    required this.store,
    required this.callback,
    Key? key,
  }) : super(key: key);

  _isMembro() {
    if (store.instituicoesOfLoggedUser == null) return false;
    if (store.instituicoesOfLoggedUser!.isEmpty) return false;
    for (var inst in store.instituicoesOfLoggedUser!) {
      if (inst.id == instituicao.id) return true;
    }
    return false;
  }

  _isLoggedInstituicao() {
    if (store.instituicaoOfLoggedUser == null) return false;
    return store.instituicaoOfLoggedUser!.id == instituicao.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          Shadows.muitoLeve(),
        ],
        borderRadius: Utils.arredondamentoPadrao,
        color: _isLoggedInstituicao() ? Cores.corDeCardCesta : Cores.white,
      ),
      width: double.infinity,
      margin: Utils.marginPadrao,
      padding: Utils.paddingPadrao,
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Container(
          width: double.infinity,
          margin: Utils.marginPadrao,
          padding: Utils.paddingPadrao,
          decoration: _isLoggedInstituicao()
              ? const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    opacity: 0.1,
                    image: AssetImage(
                      "assets/imgs/pessoas-caixas.png",
                    ),
                  ),
                )
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        instituicao.nome,
                        style: const TextStyle(
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Cores.corDeTextDentroContainer,
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "Status de verificação da instituição",
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Chip(
                        backgroundColor: instituicao.verificado
                            ? Cores.success
                            : Cores.danger,
                        avatar: Icon(
                          instituicao.verificado
                              ? Icons.verified
                              : Icons.pending,
                          color: Cores.white,
                          size: 15,
                        ),
                        label: Text(
                          instituicao.verificado ? 'Ok' : 'Pendente',
                          style: const TextStyle(
                            color: Cores.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DescriptionList(
                informacoes: <String, String>{
                  "Sigla": instituicao.sigla,
                  "Telefone": instituicao.telefone
                },
              ),
              if (_isMembro() && !_isLoggedInstituicao() ||
                  _isMembro() && store.instituicaoOfLoggedUser == null)
                InkWell(
                  onTap: () async {
                    var escolha = await exibirDialogo(
                        context,
                        "Trocar instituição",
                        "Trocar",
                        "Deseja trocar a instituição atual?");

                    if (escolha != null && escolha == 1) {
                      controller.setInstituicaoOfLoggedUser(instituicao);
                      store.setInstituicaoOfLoggedUser(instituicao);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.retweet,
                          color: Cores.info,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
