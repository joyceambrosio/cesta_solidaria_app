import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/breakpoints.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:cartallum_app/src/features/configuracoes/presentation/config_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/configuracao_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfiguracaoPage extends StatelessWidget {
  final store = CofiguracaoStore();
  final controller = Modular.get<ConfigController>();
  ConfiguracaoPage({
    Key? key,
  }) : super(key: key);

  Future<List<ConfigEntity>> _loadData() async {
    return controller.getConfigs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadData(),
        builder:
            (BuildContext ctx, AsyncSnapshot<List<ConfigEntity>> snapshot) {
          if (snapshot.hasData) {
            store.setConfigs(snapshot.data);

            return Scaffold(
              appBar: AppBar(
                title: const Text('Configurações'),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: paddingInAll,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      FormBuilderSwitch(
                        initialValue: store.usaLimiteCestas ?? false,
                        onChanged: (value) => {store.usaLimiteCestas = value},
                        name: 'usaLimiteCestas',
                        title: const Text('Usa Limite de cestas'),
                      ),
                      FormBuilderSwitch(
                        initialValue: store.restringeLimiteCestas ?? false,
                        onChanged: (value) =>
                            {store.restringeLimiteCestas = value},
                        name: 'restringeLimiteCestas',
                        title: const Text('Restringe a doação'),
                      ),
                      FormBuilderSlider(
                        initialValue: store.limiteCestas ?? 3,
                        name: 'limiteCestas',
                        min: 0.0,
                        max: 24,
                        divisions: 24,
                        activeColor: Cores.corPrincipal,
                        decoration: const InputDecoration(
                            labelText:
                                'Limite de cestas recebidas nos ultimos 12 meses'),
                        onChanged: (value) {
                          store.limiteCestas = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      FormBuilderSwitch(
                        initialValue: store.usaLimiteRendaPerCapita ?? false,
                        onChanged: (value) =>
                            {store.usaLimiteRendaPerCapita = value},
                        name: 'usaLimiteRendaPerCapita',
                        title: const Text('Usa limite de renda per-capita'),
                      ),
                      FormBuilderSwitch(
                        initialValue: store.restringeRendaPerCapita ?? false,
                        onChanged: (value) =>
                            {store.restringeRendaPerCapita = value},
                        name: 'restringeRendaPerCapita',
                        title: const Text('Restringe a doação'),
                      ),
                      FormBuilderSlider(
                        initialValue: store.limiteRendaPerCapita ?? 1200,
                        name: 'limiteRendaPerCapita',
                        min: 0.0,
                        max: 5000,
                        divisions: 5000,
                        activeColor: Cores.corPrincipal,
                        decoration: const InputDecoration(
                            labelText: 'Limite de renda per-capita'),
                        onChanged: (value) {
                          store.limiteRendaPerCapita = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      FormBuilderSwitch(
                        initialValue: store.usaLimiteRenda ?? false,
                        onChanged: (value) => {store.usaLimiteRenda = value},
                        name: 'usaLimiteRenda',
                        title: const Text('Usa Limite de renda'),
                      ),
                      FormBuilderSwitch(
                        initialValue: store.restringeLimiteRenda ?? false,
                        onChanged: (value) =>
                            {store.restringeLimiteRenda = value},
                        name: 'restringeLimiteRenda',
                        title: const Text('Restringe a doação'),
                      ),
                      FormBuilderSlider(
                        initialValue: store.limiteRenda ?? 600,
                        name: 'limiteRenda',
                        min: 0.0,
                        max: 5000,
                        divisions: 5000,
                        activeColor: Cores.corPrincipal,
                        decoration: const InputDecoration(
                            labelText: 'Limite de renda familiar'),
                        onChanged: (value) {
                          store.limiteRenda = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      ButtomField(
                        labelText: 'Salvar',
                        background: Cores.corPrincipal,
                        onClick: () async {
                          controller.setConfig(store.getConfigLimiteCestas());
                          controller.setConfig(store.getConfigLimiteRenda());
                          controller.setConfig(
                            store.getConfigLimiteRendaPerCapita(),
                          );
                          SnackApp.sucess('Sucesso ao salvar as configurações');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              // render the loading indicator
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
