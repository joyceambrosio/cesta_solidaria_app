import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/image_tile_collapse.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/map_tile.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_page_store.dart';
import 'package:cartallum_app/src/features/familias/presentation/widgets/cesta_card.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class FamiliaPageFamilia extends StatelessWidget {
  final FamiliaEntity familia;
  final FamiliaPageStore store;
  const FamiliaPageFamilia({
    required this.familia,
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FamiliaController controller = Modular.get<FamiliaController>();
    Map<String, String> familiaMap = {
      "Renda": FormatterApp.formatMonetario(familia.renda),
      "Renda per Capita":
          FormatterApp.formatMonetario(familia.rendaPerCapita()),
    };

    MapController mapController = MapController();

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
                informacoes: familiaMap,
              ),
            ),
            Observer(builder: (_) {
              if (store.familia!.comprovanteRenda != null &&
                  store.familia!.comprovanteRenda!.isNotEmpty) {
                return ImageTileCollapse(
                  imageUrl: store.familia!.comprovanteRenda!,
                  title: "Comprovante de renda",
                );
              } else {
                return const SizedBox();
              }
            }),
            Observer(builder: (_) {
              return ButtomField(
                icone: store.isDoandoCesta
                    ? const FaIcon(
                        FontAwesomeIcons.spinner,
                        size: 15,
                      )
                    : null,
                labelText: "Doar cesta",
                background: Cores.corPrincipal,
                onClick: () async {
                  store.isDoandoCesta = true;
                  final authStore = Modular.get<AuthStore>();
                  UserAuthEntity? user = await authStore.getUser();

                  if (user != null) {
                    CestaEntity? cesta = CestaEntity(
                      id: '',
                      divergente: false,
                      motivoDivergencia: '',
                      criadoEm: DateTime.now(),
                      familia: familia.id,
                      instituicao: '',
                    );

                    cesta = await controller.cestaController.preProcessarCesta(
                      '',
                      familia,
                      cesta,
                    );
                    if (cesta != null) {
                      if (cesta.divergente) {
                        var escolha = await _exibirDialogo(context, cesta,
                            'Tem certeza que deseja doar a cesta? Considere as seguintes informações para tomar a sua decisão: ${cesta.motivoDivergencia}');
                        if (escolha != null && escolha == 1) {
                          cesta = await controller.cestaController.addCesta(
                            cesta.instituicao,
                            familia,
                            cesta,
                          );
                          if (cesta != null) {
                            familia.cestasCount = familia.cestasCount! + 1;
                            store.familiaStore.addCesta(cesta);
                            SnackApp.sucess('Cesta doada com sucesso');
                          }
                        }
                      } else {
                        cesta = await controller.cestaController.addCesta(
                          cesta.instituicao,
                          familia,
                          cesta,
                        );
                        if (cesta != null) {
                          familia.cestasCount = familia.cestasCount! + 1;
                          store.familiaStore.addCesta(cesta);
                          SnackApp.sucess('Cesta doada com sucesso');
                        }
                      }
                    }
                    store.isDoandoCesta = false;
                  } else {
                    SnackApp.error('Faça o login novamente!');
                  }
                  //
                },
              );
            }),
            Container(
              width: double.infinity,
              padding: Utils.paddingPadrao,
              child: Observer(builder: (_) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: store.familiaStore.cestasLength,
                  itemBuilder: (context, index) {
                    return CestaCard(
                      cesta: store.familiaStore.cestas[index],
                    );
                  },
                );
              }),
            ),
            Observer(builder: (_) {
              if (store.familiaStore.cestas.isNotEmpty) {
                return MapTile(
                    controller: mapController,
                    center: _getCenter(),
                    markers: _getMarkers());
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }

  _getCenter() {
    for (CestaEntity cesta in store.familiaStore.cestas) {
      if (_hasLocal(cesta)) {
        return LatLng(
            store.familiaStore.cestas.first.local?.getLatitude() ?? 14.2350,
            store.familiaStore.cestas.first.local?.getLongitude() ?? 51.9253);
      }
    }
    return (LatLng(14.2350, 51.9253));
  }

  _getMarkers() {
    List<Marker> lista = [];
    for (CestaEntity cesta in store.familiaStore.cestas) {
      if (_hasLocal(cesta)) {
        lista.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(
              cesta.local!.getLatitude(),
              cesta.local!.getLongitude(),
            ),
            builder: (ctx) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    boxShadow: [
                      Shadows.muitoLeve(),
                    ],
                    borderRadius: Utils.arredondamentoPadrao,
                    color: Cores.white,
                  ),
                  child: Text(
                    FormatterApp.fromatDateHora(cesta.criadoEm),
                    textAlign: TextAlign.center,
                  ),
                ),
                const FaIcon(
                  FontAwesomeIcons.locationDot,
                  color: Cores.danger,
                ),
              ],
            ),
          ),
        );
      }
    }
    return lista;
  }

  _hasLocal(CestaEntity cesta) {
    if (cesta.local != null) {
      if (cesta.local!.coordinates.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  _exibirDialogo(context, CestaEntity cesta, String mensagem) async {
    final escolha = await showConfirmationDialog<int>(
      context: context,
      cancelLabel: "Cancelar",
      okLabel: "Doar cesta",
      title: 'Importante',
      message: mensagem,
      actions: [
        const AlertDialogAction(
          key: 1,
          label: "Sim",
          isDestructiveAction: true,
        ),
      ],
    );
    return escolha;
  }
}
