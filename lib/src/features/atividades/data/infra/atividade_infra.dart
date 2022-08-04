import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/atividades/data/datasource/interfaces/atividade_datasource.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/domain/repository/atividade_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AtividadeInfra extends AtividadeRepository {
  final AtividadeDatasource datasource;
  AtividadeInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, AtividadeEntity>> createAtividade(
    AtividadeEntity atividade,
  ) async {
    try {
      final response = await datasource.createAtividade(atividade);
      final novoEndereco =
          AtividadeEntity.fromMap(response.data['data']['data']);
      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, AtividadeEntity>> getAtividade(
      String atividadeUid) async {
    try {
      final response = await datasource.getAtividade(atividadeUid);

      final instituicao =
          AtividadeEntity.fromMap(response.data['data']['data']);

      return Right(instituicao);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<AtividadeEntity>>> getAtividades(
    Map<String, dynamic> queryParams,
  ) async {
    try {
      final response = await datasource.getAtividades(queryParams);

      final instituicaos = (response.data['data']['data'] as List)
          .map((e) => AtividadeEntity.fromMap(e))
          .toList();

      return Right(instituicaos);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
