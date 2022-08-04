import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/instituicoes/data/datasource/interfaces/instituicao_dartasource.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/repository/instituicao_repository.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InstituicaoInfra extends InstituicaoRepository {
  final InstituicaoDatasource datasource;

  InstituicaoInfra(this.datasource);
  @override
  Future<Either<ErroApp, InstituicaoEntity>> createInstituicao(
    InstituicaoEntity instituicao,
  ) async {
    try {
      final authStore = Modular.get<AuthStore>();
      final response = await datasource.createInstituicao(instituicao);

      final novainstituicao =
          InstituicaoEntity.fromMap(response.data['data']['data']);
      final roleInstituicao =
          MembroEntity.fromMap(response.data['data']['adm']);

      authStore.setInstituicao(novainstituicao);
      authStore.setRoleInstituicao(roleInstituicao);

      return Right(novainstituicao);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, InstituicaoEntity>> getInstituicao(
    String uid,
  ) async {
    try {
      final response = await datasource.getInstituicao(uid);

      final instituicao =
          InstituicaoEntity.fromMap(response.data['data']['data']);

      return Right(instituicao);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<InstituicaoEntity>>> getInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    try {
      final response = await datasource.getInstituicoes(queryParametros);

      final instituicoes = (response.data['data']['data'] as List)
          .map((e) => InstituicaoEntity.fromMap(e))
          .toList();

      return Right(instituicoes);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<InstituicaoEntity>>> getInstituicoesReport(
    Map<String, dynamic> queryParametros,
  ) async {
    try {
      final response = await datasource.getInstituicoesReport(queryParametros);

      final instituicoes = (response.data['data']['data'] as List)
          .map((e) => InstituicaoEntity.fromMap(e))
          .toList();

      return Right(instituicoes);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<InstituicaoEntity>>> searchInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    try {
      final response = await datasource.searchInstituicoes(queryParametros);

      final instituicoes = (response.data['data']['data'] as List)
          .map((e) => InstituicaoEntity.fromMap(e))
          .toList();

      return Right(instituicoes);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, InstituicaoEntity>> updateInstituicao(
    InstituicaoEntity instituicao,
  ) async {
    try {
      final response = await datasource.updateInstituicao(instituicao);

      final updateInstituicao =
          InstituicaoEntity.fromMap(response.data['data']['data']);

      return Right(updateInstituicao);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
