import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/features/membros/data/datasource/interfaces/membro_datasource.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/membros/domain/repository/membro_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MembroInfra extends MembroRepository {
  final MembroDatasource datasource;
  MembroInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, MembroEntity>> createMembro(
      String instituicaoUid, MembroEntity membro) async {
    try {
      final response = await datasource.createMembro(instituicaoUid, membro);
      final novoEndereco = MembroEntity.fromMap(response.data['data']['data']);
      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, MembroEntity>> getMembro(
      String instituicaoUid, String membroUid) async {
    try {
      final response = await datasource.getMembro(instituicaoUid, membroUid);

      final instituicao = MembroEntity.fromMap(response.data['data']['data']);

      return Right(instituicao);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<MembroEntity>>> getMembros(
      String instituicaoUid) async {
    try {
      final response = await datasource.getMembros(instituicaoUid);

      final instituicaos = (response.data['data']['data'] as List)
          .map((e) => MembroEntity.fromMap(e))
          .toList();

      return Right(instituicaos);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, void>> removerMembro(
    String instituicaoUid,
    String membroUid,
  ) async {
    try {
      await datasource.deleteMembro(instituicaoUid, membroUid);

      return const Right(null);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, MembroEntity>> updateMembro(
      String instituicaoUid, MembroEntity membro) async {
    try {
      final response = await datasource.updateMembro(instituicaoUid, membro);
      final novoEndereco = MembroEntity.fromMap(response.data['data']['data']);
      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
