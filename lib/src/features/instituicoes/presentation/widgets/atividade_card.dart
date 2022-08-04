import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/shared/mixins/maps_launcher.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Atividadecard extends StatelessWidget with MapLauncher {
  final AtividadeEntity atividade;
  const Atividadecard({
    Key? key,
    required this.atividade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        atividade.mensagem,
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
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        FormatterApp.fromatDateHora(atividade.criadoEm),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Cores.dark,
                        ),
                      ),
                    ),
                  ),
                  if (_hasLocal(atividade))
                    IconButton(
                      onPressed: () {
                        if (atividade.local != null) {}
                        launchCoords(
                          atividade.local!.getLatitude(),
                          atividade.local!.getLongitude(),
                        );
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.locationDot,
                        size: 16,
                      ),
                    ),
                  if (atividade.instituicaoId != null)
                    IconButton(
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/instituicoes/instituicao/${atividade.instituicaoId}',
                        );
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.solidBuilding,
                        size: 16,
                      ),
                    ),
                  if (atividade.familiaId != null)
                    IconButton(
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/familias/familia/${atividade.familiaId}',
                        );
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.peopleRoof,
                        size: 16,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _hasLocal(AtividadeEntity atividade) {
    if (atividade.local != null) {
      if (atividade.local!.coordinates.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
