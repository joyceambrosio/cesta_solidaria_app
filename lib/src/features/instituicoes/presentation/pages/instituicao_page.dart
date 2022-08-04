import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_page_pages/instituicao_page_endereco.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_page_pages/instituicao_page_instituicao.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_page_pages/instituicao_page_membros.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_page_stores/instituicao_page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstituicaoPage extends StatefulWidget {
  final String instituicaoId;
  const InstituicaoPage({
    required this.instituicaoId,
    Key? key,
  }) : super(key: key);

  @override
  State<InstituicaoPage> createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {
  final controller = Modular.get<InstituicaoController>();
  final store = InstituicaoPageStore();
  final authStore = Modular.get<AuthStore>();
  final controllerAtividades = Modular.get<AtividadeController>();

  int paginaAtual = 0;
  late PageController pageController;

  Future<InstituicaoEntity> getInstituicao() async {
    InstituicaoEntity? instituicao =
        await controller.getInstituicao(widget.instituicaoId);

    return instituicao!;
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
    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        title: const Text('Instituição'),
        actions: <Widget>[
          if (authStore.isAdmin() &&
              authStore.isActiveOnInstituicao() &&
              authStore.isAdminInstituicao(widget.instituicaoId) &&
              authStore.isInstituicaoMatriz(widget.instituicaoId))
            IconButton(
                onPressed: () {
                  Modular.to.pushNamed(
                    '/instituicoes/config',
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  size: 18,
                )),
          if (authStore.isAdminInstituicao(widget.instituicaoId))
            IconButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed(
                    '/instituicoes/instituicao?instituicaoId=${widget.instituicaoId}',
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.pen,
                  size: 18,
                )),
          if (authStore.isAdminInstituicao(widget.instituicaoId))
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.solidFileLines),
              onPressed: () async {
                Modular.to.pushNamed(
                  '/instituicoes/atividades?instituicaoId=${store.instituicao?.id}',
                );
              },
            )
        ],
      ),
      body: FutureBuilder(
        future: getInstituicao(),
        builder:
            (BuildContext context, AsyncSnapshot<InstituicaoEntity> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            InstituicaoEntity instituicao = snapshot.data!;
            store.setInstituicao(instituicao);

            children = <Widget>[
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: setPaginaAtual,
                  children: <Widget>[
                    InstituicaoPageInstituicao(
                      instituicao: instituicao,
                    ),
                    InstituicaoPageEndereco(
                      instituicao: instituicao,
                    ),
                    InstituicaoPageMembros(
                      instituicao: instituicao,
                      controller: controller,
                      store: store,
                    ),
                  ],
                ),
              )
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
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
                label: "Instituição",
                icon: FaIcon(FontAwesomeIcons.solidBuilding),
              ),
              BottomNavigationBarItem(
                label: "Endereço",
                icon: FaIcon(FontAwesomeIcons.solidMap),
              ),
              BottomNavigationBarItem(
                label: "Membros",
                icon: FaIcon(FontAwesomeIcons.peopleGroup),
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
