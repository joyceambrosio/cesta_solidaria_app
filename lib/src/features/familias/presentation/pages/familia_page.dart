import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/loading_app.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_page_pages/familia_page_endereco.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_page_pages/familia_page_familia.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_page_pages/familia_page_pessoas.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:io';

import 'package:open_file/open_file.dart';

class FamiliaPage extends StatefulWidget {
  final String familiaId;

  const FamiliaPage({
    required this.familiaId,
    Key? key,
  }) : super(key: key);

  @override
  State<FamiliaPage> createState() => _FamiliaFuturePage();
}

class _FamiliaFuturePage extends State<FamiliaPage> {
  final controller = Modular.get<FamiliaController>();
  final store = FamiliaPageStore();
  final authStore = Modular.get<AuthStore>();

  int paginaAtual = 0;
  late PageController pageController;

  Future<FamiliaEntity> getFamilia() async {
    FamiliaEntity? familiaEntity =
        await controller.getFamilia(widget.familiaId);
    store.setFamilia(familiaEntity);
    return familiaEntity!;
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String _selectedMenu = '';
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Cores.background,
          appBar: AppBar(title: const Text('Familia'), actions: <Widget>[
            if (authStore.hasPermissaoEditarFamilias())
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: const Text('Editar'),
                    onTap: () {
                      Modular.to.pushReplacementNamed(
                        '/familias/familia?familiaId=${widget.familiaId}',
                      );
                    },
                  ),
                  PopupMenuItem<String>(
                    value: 'gerarPdf',
                    child: const Text('Gerar pdf'),
                    onTap: () async {
                      if (store.familia != null) {
                        store.isGerandoPdf = true;
                        File? arquivo = await controller
                            .getRelatorioFamiliaSimples(store.familia!);

                        if (arquivo != null) {
                          store.isGerandoPdf = false;
                          await OpenFile.open(arquivo.path);
                        }
                        store.isGerandoPdf = false;
                      }
                    },
                  ),
                ],
              ),
          ]),
          body: FutureBuilder(
            future: getFamilia(),
            builder: (
              BuildContext context,
              AsyncSnapshot<FamiliaEntity> snapshot,
            ) {
              List<Widget> children;
              if (snapshot.hasData) {
                FamiliaEntity familia = snapshot.data!;
                store.setFamilia(familia);

                children = <Widget>[
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: setPaginaAtual,
                      children: <Widget>[
                        FamiliaPageFamilia(
                          familia: familia,
                          store: store,
                        ),
                        FamiliaPageEndereco(
                          familia: familia,
                        ),
                        FamiliaPagePessoas(
                          familia: familia,
                        )
                      ],
                    ),
                  ),
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                children = const <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Aguarde...'),
                  )
                ];
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            },
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                Shadows.leve(),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                iconSize: 30,
                selectedItemColor: Cores.corPrincipal,
                items: const [
                  BottomNavigationBarItem(
                    activeIcon: FaIcon(FontAwesomeIcons.box),
                    label: "Cestas",
                    icon: FaIcon(FontAwesomeIcons.box),
                  ),
                  BottomNavigationBarItem(
                    label: "Endereço",
                    icon: FaIcon(FontAwesomeIcons.solidMap),
                  ),
                  BottomNavigationBarItem(
                    label: "Integrantes",
                    icon: FaIcon(FontAwesomeIcons.peopleRoof),
                  ),
                ],
                currentIndex: paginaAtual,
                onTap: (pagina) {
                  pageController.animateToPage(
                    pagina,
                    duration: const Duration(microseconds: 10000),
                    curve: Curves.bounceInOut,
                  );
                },
              ),
            ),
          ),
        ),
        Observer(builder: (_) {
          if (store.isGerandoPdf) {
            return Opacity(
              opacity: store.isGerandoPdf ? 1.0 : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Cores.dark.withOpacity(0.6),
                ),
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: LoadingApp(),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        })
      ],
    );
  }
}
