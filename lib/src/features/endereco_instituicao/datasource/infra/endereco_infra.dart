import 'package:cartallum_app/src/features/endereco_instituicao/datasource/interfaces/endereco_instituicao_datasource.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';

import 'package:cartallum_app/src/features/endereco_instituicao/domain/repository/endereco_instituicao_repository.dart';

class EnderecoInstituicaoInfra extends EnderecoInstituicaoRepository {
  final EnderecoInstituicaoDatasource datasource;
  EnderecoInstituicaoInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, EnderecoInstituicaoEntity>> createEndereco(
    String instituicaoUid,
    EnderecoInstituicaoEntity endereco,
  ) async {
    try {
      final response =
          await datasource.createEndereco(instituicaoUid, endereco);
      final novoEndereco =
          EnderecoInstituicaoEntity.fromMap(response.data['data']['data']);
      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, EnderecoInstituicaoEntity>> updateEndereco(
    String instituicaoUid,
    EnderecoInstituicaoEntity endereco,
  ) async {
    try {
      final response =
          await datasource.updateEndereco(instituicaoUid, endereco);
      final updateEndereco =
          EnderecoInstituicaoEntity.fromMap(response.data['data']['data']);
      return Right(updateEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<EnderecoInstituicaoEntity>>> getEndereco(
      String instituicaoUid) async {
    try {
      final response = await datasource.getEndereco(instituicaoUid);

      final endereco = (response.data['data']['data'] as List)
          .map((e) => EnderecoInstituicaoEntity.fromMap(e))
          .toList();

      return Right(endereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, void>> deleteEndereco(
    String instituicaoUid,
    String enderecoUid,
  ) async {
    try {
      await datasource.deleteEndereco(instituicaoUid, enderecoUid);

      return const Right(null);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
