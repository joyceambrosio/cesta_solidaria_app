import 'dart:async';
import 'dart:io';

import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/loading_app.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/atividades_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/widgets/atividade_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';

class AtividadesPage extends StatefulWidget {
  final String? instituicaoId;

  const AtividadesPage({
    Key? key,
    this.instituicaoId,
  }) : super(key: key);

  @override
  State<AtividadesPage> createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  final controller = Modular.get<AtividadeController>();
  final store = AtividadesStore();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setAtividades();
    });

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        store.page++;
        fetch();
      }
    });
  }

  FutureOr fetch() async {
    await setAtividades();
  }

  getParams(bool ignorePagination) {
    if (ignorePagination) {
      var ignored = store.queryParametros ?? {};
      if (widget.instituicaoId != null) {
        ignored['instituicao'] = widget.instituicaoId;
      }
      ignored['limit'] = 200;
      ignored['page'] = 1;
      return ignored;
    }
    if (store.queryParametros == null) {
      if (widget.instituicaoId != null) {
        return {
          'sort': '-criadoEm',
          'limit': store.limit,
          'page': store.page,
          'instituicao': widget.instituicaoId
        };
      } else {
        return {'sort': '-criadoEm', 'limit': store.limit, 'page': store.page};
      }
    } else {
      if (widget.instituicaoId != null) {
        store.queryParametros!['instituicao'] = widget.instituicaoId;
      }
      store.queryParametros!['sort'] = '-criadoEm';
      store.queryParametros!['limit'] = store.limit;
      store.queryParametros!['page'] = store.page;
      return store.queryParametros;
    }
  }

  setAtividades({bool ignorePagination = false}) async {
    if (store.queryParametros != null) {
      final lista = await controller.getAtividades(
        getParams(ignorePagination),
      );
      store.addAllAtividades(lista);
    } else {
      store.queryParametros = {
        'sort': 'endereco.bairro',
        'limit': store.limit,
        'page': store.page
      };
      final lista = await controller.getAtividades(getParams(ignorePagination));
      store.addAllAtividades(lista);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Cores.background,
          appBar: AppBar(
            title: const Text('Atividades'),
            actions: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.filePdf),
                onPressed: () async {
                  store.isGerandoPdf = true;

                  final queryParams = getParams(true);
                  final atividades = await controller.getAtividades(
                    queryParams,
                  );

                  File? arquivo = await controller.getReport(
                    queryParams,
                    atividades,
                  );

                  if (arquivo != null) {
                    store.pdfPath = arquivo.path;
                    store.isGerandoPdf = false;
                    await OpenFile.open(arquivo.path);
                  }
                  store.isGerandoPdf = false;
                },
              ),
            ],
          ),
          body: Container(
            padding: Utils.paddingPadrao,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 46,
                ),
                Expanded(
                  child: Observer(builder: (_) {
                    return ListView.builder(
                      controller: scrollController,
                      itemCount: store.atividadesLength,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Atividadecard(
                              atividade: store.atividades[index],
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
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
