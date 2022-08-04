import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/repository/endereco_instituicao_repository.dart';

import 'package:dartz/dartz.dart';

class UpdateEnderecoInstituicaoUsecase
    extends ErroHandler<EnderecoInstituicaoEntity> {
  final EnderecoInstituicaoRepository repository;

  UpdateEnderecoInstituicaoUsecase(this.repository);

  Future<Either<ErroApp, EnderecoInstituicaoEntity>> updateEnderecoInstituicao(
    String instituicao,
    EnderecoInstituicaoEntity endereco,
  ) async {
    var result = await repository.updateEndereco(instituicao, endereco);
    return handleError(result);
  }
}
