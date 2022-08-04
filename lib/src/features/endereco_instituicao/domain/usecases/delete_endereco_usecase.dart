import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/repository/endereco_instituicao_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteEnderecoInstituicaoUsecase extends ErroHandler<void> {
  final EnderecoInstituicaoRepository repository;
  DeleteEnderecoInstituicaoUsecase(
    this.repository,
  );

  Future<Either<ErroApp, void>> deleteEndereco(
      String instituicaoUid, String enderecoUid) async {
    var result = await repository.deleteEndereco(instituicaoUid, enderecoUid);
    return handleError(result);
  }
}
