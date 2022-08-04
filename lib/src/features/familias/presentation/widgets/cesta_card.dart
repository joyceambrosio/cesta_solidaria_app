import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/shared/mixins/maps_launcher.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CestaCard extends StatelessWidget with MapLauncher {
  final CestaEntity cesta;
  const CestaCard({
    required this.cesta,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cesta.divergente) {
      return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding: Utils.paddingPadrao,
        decoration: BoxDecoration(
          boxShadow: [
            Shadows.muitoLeve(),
          ],
          borderRadius: Utils.arredondamentoPadrao,
          color: Cores.white,
        ),
        child: ExpansionTile(
          trailing: Container(
            padding: const EdgeInsets.only(left: 0, right: 10),
            child: const FaIcon(
              FontAwesomeIcons.exclamation,
              color: Cores.danger,
            ),
          ),
          title: _listTile(),
          tilePadding: const EdgeInsets.only(
            left: 0,
            right: 0,
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(cesta.motivoDivergencia),
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding: Utils.paddingPadrao,
        decoration: BoxDecoration(
          boxShadow: [
            Shadows.muitoLeve(),
          ],
          borderRadius: Utils.arredondamentoPadrao,
          color: Cores.white,
        ),
        child: _listTile(),
      );
    }
  }

  _listTile() {
    return ListTile(
      title: Text(
        FormatterApp.fromatDateHora(cesta.criadoEm),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed(
                '/instituicoes/instituicao/${cesta.instituicao}',
              );
            },
            icon: const FaIcon(FontAwesomeIcons.solidBuilding),
          ),
          if (_hasLocal(cesta))
            IconButton(
              onPressed: () {
                launchCoords(
                  cesta.local!.getLatitude(),
                  cesta.local!.getLongitude(),
                );
              },
              icon: const FaIcon(FontAwesomeIcons.mapLocation),
            )
        ],
      ),
    );
  }

  _hasLocal(CestaEntity cesta) {
    if (cesta.local != null) {
      if (cesta.local!.coordinates.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
