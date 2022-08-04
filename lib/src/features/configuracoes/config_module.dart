import 'package:cartallum_app/src/features/configuracoes/data/datasource/remote/config_api.dart';
import 'package:cartallum_app/src/features/configuracoes/data/infra/config_infra.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/usecases/get_configs_uscecase.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/usecases/set_config_uscecase.dart';
import 'package:cartallum_app/src/features/configuracoes/presentation/config_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfiguracoesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => ConfigApi(i()), export: true),
        Bind.factory((i) => ConfigInfra(i()), export: true),
        Bind.factory((i) => SetConfigUsecase(i()), export: true),
        Bind.factory((i) => GetConfigsUsecase(i()), export: true),
        Bind.factory((i) => GetConfigsUsecase(i()), export: true),
        Bind.lazySingleton((i) => ConfigController(i(), i()), export: true),
      ];
}
