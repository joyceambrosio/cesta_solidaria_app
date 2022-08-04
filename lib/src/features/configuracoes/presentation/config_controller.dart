import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/mixins/coordinate_handler.dart';
import 'package:cartallum_app/src/core/storage/config_store.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/usecases/get_configs_uscecase.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/usecases/set_config_uscecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigController with CoordinatesHandler {
  SetConfigUsecase setConfigUsecase;
  GetConfigsUsecase getConfigsUsecase;

  AtividadeController atividadeLog = Modular.get<AtividadeController>();

  ConfigController(
    this.setConfigUsecase,
    this.getConfigsUsecase,
  );

  Future<ConfigEntity?> setConfig(
    ConfigEntity config,
  ) async {
    var resultado = await setConfigUsecase.setConfig(
      config,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      atividadeLog.create(AtividadeEntity(
        criadoEm: DateTime.now(),
        metodo: 'PUT',
        level: 'Information',
        result: 'success',
        mensagem: 'configuração alterada',
        cestaId: r.id,
      ));
      loadConfigs();
      return r;
    });
  }

  Future<List<ConfigEntity>> getConfigs() async {
    var resultado = await getConfigsUsecase.getConfigs();

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  loadConfigs() async {
    final configStore = Modular.get<ConfigStore>();
    configStore.setConfigs(await getConfigs());
  }
}
