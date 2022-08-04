import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/repository/membro_repository.dart';

import 'package:dartz/dartz.dart';

class UpdateMembroUsecase extends ErroHandler<MembroEntity> {
  final MembroRepository repository;

  UpdateMembroUsecase(this.repository);

  Future<Either<ErroApp, MembroEntity>> updateMembro(
    String instituicaoUid,
    MembroEntity membroEntity,
  ) async {
    var result = await repository.updateMembro(instituicaoUid, membroEntity);
    return handleError(result);
  }
}
