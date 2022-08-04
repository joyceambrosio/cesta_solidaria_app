import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/configuracoes/data/datasource/interfaces/config_datasource.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/repository/config_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ConfigInfra extends ConfigRepository {
  final ConfigDatasource datasource;
  ConfigInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, ConfigEntity>> setConfig(
      ConfigEntity configuracoes) async {
    try {
      Response response;
      if (configuracoes.id != '') {
        response = await datasource.setConfig(configuracoes);
      } else {
        response = await datasource.createConfig(configuracoes);
      }
      final novoEndereco = ConfigEntity.fromMap(response.data['data']['data']);
      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<ConfigEntity>>> getConfigs() async {
    try {
      final response = await datasource.getConfigs();

      final instituicaos = (response.data['data']['data'] as List)
          .map((e) => ConfigEntity.fromMap(e))
          .toList();

      return Right(instituicaos);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
