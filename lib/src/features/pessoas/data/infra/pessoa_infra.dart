import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/features/pessoas/data/datasource/interfaces/pessoa_dartasource.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/pessoas/domain/repository/pessoa_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class PessoaInfra extends PessoaRepository {
  final PessoaDatasource datasource;
  PessoaInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, PessoaEntity>> createPessoa(
    String familiaUid,
    PessoaEntity pessoa,
    XFile? comprovante,
  ) async {
    try {
      final response = await datasource.createPessoa(familiaUid, pessoa);
      final novaPessoa = PessoaEntity.fromMap(response.data['data']['data']);

      if (comprovante != null) {
        return createComprovante(
          familiaUid,
          novaPessoa,
          comprovante,
        );
      }

      return Right(novaPessoa);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, PessoaEntity>> updatePessoa(
    String familiaUid,
    PessoaEntity pessoa,
    XFile? comprovante,
  ) async {
    try {
      final response = await datasource.updatePessoa(familiaUid, pessoa);
      final novaPessoa = PessoaEntity.fromMap(response.data['data']['data']);

      if (comprovante != null) {
        return createComprovante(
          familiaUid,
          novaPessoa,
          comprovante,
        );
      }

      return Right(novaPessoa);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  Future<Either<ErroApp, PessoaEntity>> createComprovante(
    String familiaUid,
    PessoaEntity pessoa,
    XFile? comprovante,
  ) async {
    try {
      final response = await datasource.createComprovante(
        familiaUid,
        pessoa,
        comprovante,
      );

      final novaPessoa = PessoaEntity.fromMap(response.data['data']['data']);

      return Right(novaPessoa);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, PessoaEntity>> getPessoa(
      String familiaUid, String pessoaUid) async {
    try {
      final response = await datasource.getPessoa(familiaUid, pessoaUid);

      final familia = PessoaEntity.fromMap(response.data['data']['data']);

      return Right(familia);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<PessoaEntity>>> getPessoas(
      String familiaUid) async {
    try {
      final response = await datasource.getPessoas(familiaUid);

      final familias = (response.data['data']['data'] as List)
          .map((e) => PessoaEntity.fromMap(e))
          .toList();

      return Right(familias);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, void>> removerPessoa(
    String familiaUid,
    String pessoaUid,
  ) async {
    try {
      await datasource.deletePessoa(familiaUid, pessoaUid);

      return const Right(null);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
