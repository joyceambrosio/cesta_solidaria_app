import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/mixins/maps_launcher.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstituicaoPageEndereco extends StatelessWidget with MapLauncher {
  final InstituicaoEntity instituicao;
  const InstituicaoPageEndereco({
    required this.instituicao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Modular.get<AuthStore>();
    if (instituicao.enderecos == null) {
      if (instituicao.enderecos!.isEmpty) {
        return const SizedBox();
      }
    }
    EnderecoInstituicaoEntity endereco = instituicao.enderecos!.first;
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
                  "Logradouro": endereco.logradouro,
                  "Número": endereco.numero ?? '',
                  "Bairro": endereco.bairro,
                  "Cep": endereco.cep,
                  "UF": endereco.estado,
                  "Complemento": endereco.complemento ?? '',
                  "Ponto de referência": endereco.pontoReferencia ?? '',
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
                          endereco.stringMaps(),
                        );
                      },
                      icon: const FaIcon(FontAwesomeIcons.mapLocation),
                    )
                  ],
                ),
              ),
            ),
            if (authStore.isAdmin())
              if (_hasLocal(endereco))
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
                              endereco.local!.getLatitude(),
                              endereco.local!.getLongitude(),
                            );
                          },
                          icon: const FaIcon(FontAwesomeIcons.mapLocation),
                        )
                      ],
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }

  _hasLocal(EnderecoInstituicaoEntity endereco) {
    if (endereco.local != null) {
      if (endereco.local!.coordinates.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
