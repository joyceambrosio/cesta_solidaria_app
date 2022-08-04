import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/membros/domain/repository/membro_repository.dart';

import 'package:dartz/dartz.dart';

class RemoveMembroUsecase extends ErroHandler<void> {
  final MembroRepository repository;

  RemoveMembroUsecase(this.repository);

  Future<Either<ErroApp, void>> removerMembro(
    String instituicaoUid,
    String membroUid,
  ) async {
    var result = await repository.removerMembro(instituicaoUid, membroUid);
    return handleError(result);
  }
}
