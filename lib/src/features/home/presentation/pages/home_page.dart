import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/core/storage/config_store.dart';
import 'package:cartallum_app/src/features/auth/presentation/pages/user_page.dart';
import 'package:cartallum_app/src/features/configuracoes/presentation/config_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familias_home_page.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicoes_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _NovaHomePage();
}

class _NovaHomePage extends State<HomePage> {
  final authStore = Modular.get<AuthStore>();
  late PageController pageController;
  int paginaAtual = 1;

  @override
  void initState() {
    super.initState();
    loadConfigs();
    pageController = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  loadConfigs() async {
    final configStore = Modular.get<ConfigStore>();
    final configController = Modular.get<ConfigController>();
    configStore.setConfigs(await configController.getConfigs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      body: PageView(
        controller: pageController,
        onPageChanged: setPaginaAtual,
        children: const <Widget>[
          UserAuthPage(),
          InstituicoesHomePage(),
          FamiliasHomePage(),
        ],
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
            topLeft: Radius.circular(18.0),
            topRight: Radius.circular(18.0),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Cores.corPrincipal,
            items: const [
              BottomNavigationBarItem(
                label: "Perfil",
                tooltip: "Meu perfil",
                icon: FaIcon(FontAwesomeIcons.solidUser, size: 15),
              ),
              BottomNavigationBarItem(
                label: "Instituições",
                tooltip: "Minhas instituições",
                icon: FaIcon(FontAwesomeIcons.solidBuilding, size: 15),
              ),
              BottomNavigationBarItem(
                label: "Famílias",
                tooltip: "Familias",
                icon: FaIcon(FontAwesomeIcons.house, size: 15),
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
    );
  }
}
