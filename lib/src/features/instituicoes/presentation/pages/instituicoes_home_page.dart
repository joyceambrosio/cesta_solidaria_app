import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/loading_app.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_icon_field.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/widgets/instituicoes_vazias.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicoes_home_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/widgets/instituicao_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';

import 'dart:io';

class InstituicoesHomePage extends StatefulWidget {
  const InstituicoesHomePage({Key? key}) : super(key: key);

  @override
  State<InstituicoesHomePage> createState() => _InstituicoesHomePageState();
}

class _InstituicoesHomePageState extends State<InstituicoesHomePage> {
  final controller = Modular.get<InstituicaoController>();
  final store = InstituicoesHomeStore();
  final authStore = Modular.get<AuthStore>();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setInstituicoes();
      setInstituicoesOfLoggedUser();
      setInstituicaoOfLoggedUser();
    });

    scrollController = ScrollController();
    scrollController.addListener(() {
      store.showFloatingActionButton =
          scrollController.position.maxScrollExtent != scrollController.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  resync() async {
    setInstituicoes();
    setInstituicoesOfLoggedUser();
    setInstituicaoOfLoggedUser();
  }

  setInstituicoesOfLoggedUser() async {
    store.instituicoesOfLoggedUser =
        await controller.getInstituicoesOfLoggedUser();
  }

  setInstituicaoOfLoggedUser() async {
    store.setInstituicaoOfLoggedUser(
      await controller.getInstituicaoOfLoggedUser(),
    );

    if (store.instituicaoOfLoggedUser != null) {
      store.isAdminOfLoggedInstituicao = await authStore.isAdminInstituicao(
        store.instituicaoOfLoggedUser!.id,
      );
    } else {
      store.isAdminOfLoggedInstituicao = false;
    }
  }

  setInstituicoes() async {
    List<InstituicaoEntity> instituicoes = await controller.getInstituicoes(
      store.queryParametros,
    );
    instituicoes = await controller.getMembrosEUsuarios(instituicoes);
    store.setInstituicoes(instituicoes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(title: const Text('Instituições'), actions: [
        if (authStore.isAdmin())
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidFileLines),
            onPressed: () async {
              Modular.to.pushNamed('/instituicoes/atividades');
            },
          ),
        if (authStore.isAdminOnCurrentInstituicao())
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.filePdf),
            onPressed: () async {
              store.isGerandoPdf = true;

              File? arquivo = await controller.getReport();

              if (arquivo != null) {
                store.pdfPath = arquivo.path;
                store.isGerandoPdf = false;
                await OpenFile.open(arquivo.path);
              }
              store.isGerandoPdf = false;
            },
          ),
      ]),
      body: Stack(
        children: [
          Container(
            padding: Utils.paddingPadrao,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                FormTextIconField(
                  controller: store.controllerBusca,
                  hintText: "Nome",
                  labelText: "Nome",
                  errorText: "",
                  fieldType: TextInputType.text,
                  isValid: true,
                  validateAction: (value) {
                    store.validateInstituicao();
                  },
                  icon: Icons.search,
                  iconAction: () async {
                    if (store.controllerBusca.text.isNotEmpty) {
                      store.queryParametros = {
                        'searchValue': store.controllerBusca.text,
                      };
                      List<InstituicaoEntity> instituicoes =
                          await controller.searchInstituicoes(
                        store.queryParametros,
                      );
                      await store.setInstituicoes(instituicoes);
                      store.controllerBusca.text = "";
                    } else {
                      await setInstituicoes();
                    }
                  },
                ),
                Observer(builder: (_) {
                  if (store.isEmpty) {
                    return const InstituicoesVazias();
                  } else {
                    return const SizedBox();
                  }
                }),
                Expanded(
                  child: Observer(
                    builder: (_) {
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: store.instituicoesLength,
                        itemBuilder: (context, index) {
                          return CardInstituicao(
                            controller: controller,
                            store: store,
                            instituicao: store.instituicoes[index],
                            callback: () {
                              Modular.to
                                  .pushNamed(
                                    '/instituicoes/instituicao/${store.instituicoes[index].id}',
                                  )
                                  .then((_) async => {resync()});
                            },
                          );
                        },
                      );
                    },
                  ),
                )
              ],
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
          }),
        ],
      ),
      floatingActionButton: Observer(builder: (_) {
        if (store.showFloatingActionButton) {
          return FloatingActionButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              onPressed: () {
                Modular.to.pushNamed('/instituicoes/instituicao').then(
                      (_) async => {resync()},
                    );
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.add));
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
