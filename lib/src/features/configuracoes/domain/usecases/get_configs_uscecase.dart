import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/repository/config_repository.dart';

import 'package:dartz/dartz.dart';

class GetConfigsUsecase extends ErroHandler<List<ConfigEntity>> {
  final ConfigRepository repository;

  GetConfigsUsecase(this.repository);

  Future<Either<ErroApp, List<ConfigEntity>>> getConfigs() async {
    var result = await repository.getConfigs();
    return handleError(result);
  }
}
