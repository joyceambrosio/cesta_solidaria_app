import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/widgets/pessoa_listtile_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class FamiliaCard extends StatelessWidget {
  final FamiliaEntity familia;
  final String? lastBairro;
  final int index;

  const FamiliaCard({
    required this.familia,
    required this.lastBairro,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int adultos = 0;
    int criancas = 0;
    int idadeNaN = 0;

    if (familia.integrantes != null) {
      if (familia.integrantes!.isNotEmpty) {
        for (var element in familia.integrantes!) {
          if (element.idade != null) {
            if (element.idade! >= 18) {
              adultos = adultos + 1;
            } else {
              criancas = criancas + 1;
            }
          } else {
            idadeNaN = idadeNaN + 1;
          }
        }
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _handleGroup(),
        InkWell(
          onTap: () {
            Modular.to.pushNamed('/familias/familia/${familia.id}');
          },
          child: Container(
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
                (familia.integrantes == null || familia.integrantes!.isEmpty)
                    ? const SizedBox()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: familia.integrantes!.length,
                        itemBuilder: (context, index) {
                          return PessoaHomeListTile(
                            pessoa: familia.integrantes![index],
                            isExibeDependente: false,
                          );
                        },
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (adultos > 0)
                      Tooltip(
                        message: "Adultos",
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Chip(
                            label: Text(
                              adultos.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                            avatar: const FaIcon(
                              FontAwesomeIcons.person,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    if (criancas > 0)
                      Tooltip(
                        message: "Crianças",
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Chip(
                            label: Text(
                              criancas.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                            avatar: const FaIcon(
                              FontAwesomeIcons.baby,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    if (familia.cestasCount! > 0 && familia.cestas != null)
                      if (familia.cestas!.isNotEmpty)
                        Tooltip(
                          message: "Última cesta recebida",
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Chip(
                              label: Text(
                                DateFormat("dd/MM/yyyy")
                                    .format(familia.cestas!.first.criadoEm),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                    if (familia.cestasCount! > 0)
                      Tooltip(
                        message: "Cestas recebidas no ano corrente",
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 10),
                          child: Chip(
                            backgroundColor: familia.cestasCount! <= 1
                                ? Cores.success
                                : familia.cestasCount == 2
                                    ? Cores.warning
                                    : Cores.danger,
                            avatar: const Icon(
                              Icons.inventory_2,
                              size: 15,
                            ),
                            label: Text(
                              familia.cestasCount.toString(),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _handleGroup() {
    if (familia.endereco == null) {
      return const SizedBox();
    }
    if (familia.endereco != null) {
      return _getGroup(lastBairro, familia.endereco!.bairro);
    }
  }

  _getGroup(String? lastBairro, String? bairroAtual) {
    if (lastBairro == null && bairroAtual == null) {
      return const SizedBox();
    }
    if (lastBairro! == bairroAtual! && index != 0) {
      return const SizedBox();
    } else {
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            Shadows.muitoLeve(),
          ],
          borderRadius: Utils.arredondamentoPadrao,
          color: Cores.corPrincipal,
        ),
        width: double.infinity,
        margin: Utils.marginPadrao,
        padding: Utils.paddingPadrao,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bairroAtual,
              style: const TextStyle(color: Cores.white),
            )
          ],
        ),
      );
    }
  }
}
