import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/features/cesta/data/datasource/interfaces/cesta_datasource.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/repository/cesta_repository.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CestaInfra extends CestaRepository {
  final CestaDatasource datasource;
  CestaInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, CestaEntity>> createCesta(
      String instituicaoUid, CestaEntity cesta) async {
    try {
      final response = await datasource.createCesta(instituicaoUid, cesta);
      final novoEndereco = CestaEntity.fromMap(response.data['data']['data']);
      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, CestaEntity>> getCesta(
      String instituicaoUid, String cestaUid) async {
    try {
      final response = await datasource.getCesta(instituicaoUid, cestaUid);

      final instituicao = CestaEntity.fromMap(response.data['data']['data']);

      return Right(instituicao);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<CestaEntity>>> getCestas(
      String instituicaoUid) async {
    try {
      final response = await datasource.getCestas(instituicaoUid);

      final instituicaos = (response.data['data']['data'] as List)
          .map((e) => CestaEntity.fromMap(e))
          .toList();

      return Right(instituicaos);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
