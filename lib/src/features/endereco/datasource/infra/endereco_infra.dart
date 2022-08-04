import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/features/endereco/datasource/interfaces/endereco_datasource.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:cartallum_app/src/features/endereco/domain/repository/endereco_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:cartallum_app/src/core/errors/erro_app.dart';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class EnderecoInfra extends EnderecoRepository {
  final EnderecoDatasource datasource;
  EnderecoInfra(
    this.datasource,
  );

  @override
  Future<Either<ErroApp, EnderecoEntity>> createEndereco(
    String familiaUid,
    EnderecoEntity endereco,
    XFile? comprovante,
  ) async {
    try {
      final response = await datasource.createEndereco(
        familiaUid,
        endereco,
      );
      final novoEndereco =
          EnderecoEntity.fromMap(response.data['data']['data']['endereco']);

      if (comprovante != null) {
        final novoEnderecoComfoto = createComprovanteEndereco(
          familiaUid,
          novoEndereco,
          comprovante,
        );
        return novoEnderecoComfoto;
      }

      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  Future<Either<ErroApp, EnderecoEntity>> createComprovanteEndereco(
    String familiaUid,
    EnderecoEntity endereco,
    XFile? comprovante,
  ) async {
    try {
      final response = await datasource.createComprovanteEndereco(
        familiaUid,
        endereco,
        comprovante,
      );

      final novoEndereco =
          EnderecoEntity.fromMap(response.data['data']['data']['endereco']);

      return Right(novoEndereco);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
