import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/repository/config_repository.dart';

import 'package:dartz/dartz.dart';

class SetConfigUsecase extends ErroHandler<ConfigEntity> {
  final ConfigRepository repository;

  SetConfigUsecase(this.repository);

  Future<Either<ErroApp, ConfigEntity>> setConfig(
    ConfigEntity configEntity,
  ) async {
    var result = await repository.setConfig(configEntity);
    return handleError(result);
  }
}
