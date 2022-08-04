import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:dartz/dartz.dart';

import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/familias/data/datasource/interfaces/familia_datasource.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/repository/familia_repository.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class FamiliaInfra extends FamiliaRepository {
  final FamiliaDatasource datasource;
  FamiliaInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, FamiliaEntity>> createFamilia(
    FamiliaEntity familia,
    XFile? comprovanteRenda,
    XFile? comprovanteEndereco,
  ) async {
    try {
      final response = await datasource.createFamilia(familia);

      final novaFamilia = FamiliaEntity.fromMap(response.data['data']['data']);

      if (comprovanteRenda != null) {
        var resultFotos = createComprovanteRenda(
          novaFamilia,
          comprovanteRenda,
        );
        return resultFotos;
      }

      if (comprovanteEndereco != null) {
        var resultFotos = createComprovanteEndereco(
          novaFamilia,
          comprovanteEndereco,
        );
        return resultFotos;
      }

      return Right(novaFamilia);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, FamiliaEntity>> updateFamilia(
    FamiliaEntity familia,
    XFile? comprovanteRenda,
    XFile? comprovanteEndereco,
  ) async {
    try {
      final response = await datasource.updateFamilia(familia);

      final updateFamilia = FamiliaEntity.fromMap(
        response.data['data']['data'],
      );

      if (comprovanteRenda != null) {
        var resultFotos = createComprovanteRenda(
          updateFamilia,
          comprovanteRenda,
        );
        return resultFotos;
      }

      if (comprovanteEndereco != null) {
        var resultFotos = createComprovanteEndereco(
          updateFamilia,
          comprovanteEndereco,
        );
        return resultFotos;
      }

      return Right(updateFamilia);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  Future<Either<ErroApp, FamiliaEntity>> createComprovanteEndereco(
    FamiliaEntity familia,
    XFile? comprovante,
  ) async {
    try {
      final response = await datasource.createComprovanteEndereco(
        familia,
        comprovante,
      );

      final novaFamilia = FamiliaEntity.fromMap(response.data['data']['data']);

      return Right(novaFamilia);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  Future<Either<ErroApp, FamiliaEntity>> createComprovanteRenda(
    FamiliaEntity familia,
    XFile? comprovante,
  ) async {
    try {
      final response = await datasource.createComprovanteRenda(
        familia,
        comprovante,
      );

      final novaFamilia = FamiliaEntity.fromMap(response.data['data']['data']);

      return Right(novaFamilia);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, FamiliaEntity>> getFamilia(String uid) async {
    try {
      final response = await datasource.getFamilia(uid);

      final familia = FamiliaEntity.fromMap(response.data['data']['data']);

      return Right(familia);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<FamiliaEntity>>> getFamilias(
    Map<String, dynamic> queryParametros,
  ) async {
    try {
      final response = await datasource.getFamilias(queryParametros);

      final familias = (response.data['data']['data'] as List)
          .map((e) => FamiliaEntity.fromMap(e))
          .toList();

      return Right(familias);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<FamiliaEntity>>> searchFamilias(
      Map<String, dynamic> queryParametros) async {
    try {
      final response = await datasource.searchFamilias(queryParametros);

      final familias = (response.data['data']['data'] as List)
          .map((e) => FamiliaEntity.fromMap(e))
          .toList();

      return Right(familias);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
