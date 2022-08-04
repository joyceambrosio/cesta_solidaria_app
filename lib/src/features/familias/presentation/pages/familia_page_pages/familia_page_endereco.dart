import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/mixins/maps_launcher.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/image_tile_collapse.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FamiliaPageEndereco extends StatelessWidget with MapLauncher {
  final FamiliaEntity familia;
  const FamiliaPageEndereco({
    required this.familia,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (familia.endereco != null) {
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
                child: DescriptionList(
                  titulo: "Endereço",
                  informacoes: {
                    "Logradouro": familia.endereco!.logradouro,
                    "Número": familia.endereco!.numero,
                    "Bairro": familia.endereco!.bairro,
                    "Cep": familia.endereco!.cep,
                    "UF": familia.endereco!.estado,
                    "Complemento": familia.endereco!.complemento,
                    "Ponto de referência": familia.endereco!.pontoReferencia,
                  },
                ),
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
                child: ListTile(
                  title: const Text('Endereço'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          launchEndereco(
                            familia.endereco!.stringMaps(),
                          );
                        },
                        icon: const FaIcon(FontAwesomeIcons.mapLocation),
                      )
                    ],
                  ),
                ),
              ),
              if (_hasLocal(familia.endereco!))
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
                  child: ListTile(
                    title: const Text('Local de Cadastro'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            launchCoords(
                              familia.endereco!.local!.getLatitude(),
                              familia.endereco!.local!.getLongitude(),
                            );
                          },
                          icon: const FaIcon(FontAwesomeIcons.mapLocation),
                        )
                      ],
                    ),
                  ),
                ),
              ImageTileCollapse(
                imageUrl: familia.comprovanteEndereco,
                title: "Comprovante de endereço",
              )
            ],
          ),
        ),
      );
    }
    return Container();
  }

  _hasLocal(EnderecoEntity endereco) {
    if (endereco.local != null) {
      if (endereco.local!.coordinates.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
