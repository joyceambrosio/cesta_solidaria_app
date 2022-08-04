import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ConfigRepository {
  Future<Either<ErroApp, ConfigEntity>> setConfig(ConfigEntity configuracoes);
  Future<Either<ErroApp, List<ConfigEntity>>> getConfigs();
}
