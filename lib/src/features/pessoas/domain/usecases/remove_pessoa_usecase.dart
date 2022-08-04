import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/pessoas/domain/repository/pessoa_repository.dart';

import 'package:dartz/dartz.dart';

class RemovePessoaUsecase extends ErroHandler<void> {
  final PessoaRepository repository;

  RemovePessoaUsecase(this.repository);

  Future<Either<ErroApp, void>> removerPessoa(
    String familiaUid,
    String pessoaUid,
  ) async {
    var result = await repository.removerPessoa(familiaUid, pessoaUid);
    return handleError(result);
  }
}
