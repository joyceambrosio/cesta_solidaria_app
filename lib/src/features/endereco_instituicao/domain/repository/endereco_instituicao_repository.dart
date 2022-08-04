import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';

import 'package:dartz/dartz.dart';

abstract class EnderecoInstituicaoRepository {
  Future<Either<ErroApp, List<EnderecoInstituicaoEntity>>> getEndereco(
      String instituicaoUid);

  Future<Either<ErroApp, EnderecoInstituicaoEntity>> createEndereco(
      String instituicaoUid, EnderecoInstituicaoEntity endereco);

  Future<Either<ErroApp, EnderecoInstituicaoEntity>> updateEndereco(
      String instituicaoUid, EnderecoInstituicaoEntity endereco);

  Future<Either<ErroApp, void>> deleteEndereco(
    String instituicaoUid,
    String enderecoUid,
  );
}
