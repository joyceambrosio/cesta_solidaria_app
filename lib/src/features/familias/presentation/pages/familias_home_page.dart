import 'dart:async';
import 'dart:io';

import 'package:cartallum_app/src/core/shared/widgets/display/loading_app.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familias_home_store.dart';
import 'package:cartallum_app/src/features/familias/presentation/widgets/familia_card.dart';
import 'package:cartallum_app/src/features/familias/presentation/widgets/familias_vazias.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_icon_field.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';

class FamiliasHomePage extends StatefulWidget {
  const FamiliasHomePage({Key? key}) : super(key: key);

  @override
  State<FamiliasHomePage> createState() => _FamiliasHomePageState();
}

class _FamiliasHomePageState extends State<FamiliasHomePage> {
  final controller = Modular.get<FamiliaController>();
  final store = FamiliasHomeStore();
  final scrollController = ScrollController();
  final authStore = Modular.get<AuthStore>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setFamilias();
    });

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        store.page++;
        fetch();
      }
    });
  }

  getParams(bool ignorePagination) {
    if (ignorePagination) {
      var ignored = store.queryParametros ?? {};
      ignored.remove('limit');
      ignored.remove('page');
      return ignored;
    }
    if (store.queryParametros == null) {
      return {
        'sort': 'endereco.bairro',
        'limit': store.limit,
        'page': store.page
      };
    } else {
      store.queryParametros!['sort'] = 'endereco.bairro';
      store.queryParametros!['limit'] = store.limit;
      store.queryParametros!['page'] = store.page;
      return store.queryParametros;
    }
  }

  setFamilias({bool ignorePagination = false}) async {
    if (authStore.hasAcessoFamilias()) {
      if (store.queryParametros != null) {
        final lista = await controller.searchFamilias(
          getParams(ignorePagination),
        );
        store.addAllFamilias(lista);
      } else {
        store.queryParametros = {
          'sort': 'endereco.bairro',
          'limit': store.limit,
          'page': store.page
        };
        final lista = await controller.getFamilias(getParams(ignorePagination));
        store.addAllFamilias(lista);
      }
    } else {
      store.addAllFamilias([]);
    }
  }

  FutureOr fetch() async {
    await setFamilias();
  }

  FutureOr goBack(dynamic value) async {
    store.familias = [];
    store.page = 1;
    store.queryParametros = value;
    await setFamilias();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Cores.background,
          appBar: AppBar(
            title: const Text('Famílias'),
            actions: [
              authStore.isActiveOnInstituicao()
                  ? IconButton(
                      icon: const FaIcon(FontAwesomeIcons.filePdf),
                      onPressed: () async {
                        store.isGerandoPdf = true;

                        final queryParams = getParams(true);
                        final familias = await controller.searchFamilias(
                          queryParams,
                        );

                        File? arquivo = await controller.getReport(
                          queryParams,
                          familias,
                        );

                        if (arquivo != null) {
                          store.pdfPath = arquivo.path;
                          store.isGerandoPdf = false;
                          await OpenFile.open(arquivo.path);
                        }
                        store.isGerandoPdf = false;
                      },
                    )
                  : const SizedBox(),
              authStore.isActiveOnInstituicao()
                  ? IconButton(
                      onPressed: () async {
                        Modular.to
                            .pushNamed('/familias/familia/filter',
                                arguments: store)
                            .then(goBack);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.sliders,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          body: Container(
            padding: Utils.paddingPadrao,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  if (authStore.isActiveOnInstituicao()) {
                    return FormTextIconField(
                      controller: store.controllerBusca,
                      hintText: store.filterAmigavel,
                      labelText: store.filterAmigavel,
                      errorText: "",
                      fieldType: TextInputType.text,
                      isValid: true,
                      validateAction: (value) {
                        return true;
                      },
                      icon: Icons.search,
                      iconAction: () async {
                        store.page = 1;
                        if (store.controllerBusca.text.isNotEmpty) {
                          store.queryParametros = {
                            'searchValue': store.controllerBusca.text,
                          };

                          store.familias = [];
                          await setFamilias();
                          store.page = 1;
                          store.controllerBusca.text = '';
                        } else {
                          store.queryParametros = null;
                          store.page = 1;
                          store.familias = [];
                          await setFamilias();
                        }
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
                Expanded(
                  child: Observer(builder: (_) {
                    if (authStore.hasAcessoFamilias()) {
                      if (store.isEmpty) {
                        return const SizedBox();
                      } else {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: store.familiasLength,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FamiliaCard(
                                  index: index,
                                  familia: store.familias[index],
                                  lastBairro: index == 0
                                      ? store.familias[index].endereco?.bairro
                                      : store
                                          .familias[index - 1].endereco?.bairro,
                                ),
                                if (index == store.familiasLength - 1)
                                  Observer(builder: (_) {
                                    if (!store.isLastPage) {
                                      return const LoadingApp();
                                    }
                                    return const SizedBox();
                                  })
                              ],
                            );
                          },
                        );
                      }
                    } else {
                      return const FamiliasVazias();
                    }
                  }),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            onPressed: () {
              if (authStore.isActiveOnInstituicao()) {
                Modular.to
                    .pushNamed('/familias/familia')
                    .then((value) => goBack(value));
              }
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
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
