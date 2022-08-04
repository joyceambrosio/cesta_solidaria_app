import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/repository/endereco_instituicao_repository.dart';
import 'package:dartz/dartz.dart';

class GetEnderecoInstituicaoUsecase
    extends ErroHandler<List<EnderecoInstituicaoEntity>> {
  final EnderecoInstituicaoRepository repository;
  GetEnderecoInstituicaoUsecase(
    this.repository,
  );

  Future<Either<ErroApp, List<EnderecoInstituicaoEntity>>>
      getEnderecoInstituicao(
    String instituicao,
  ) async {
    var result = await repository.getEndereco(instituicao);
    return handleError(result);
  }
}
