import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/repository/membro_repository.dart';

import 'package:dartz/dartz.dart';

class AddMembroUsecase extends ErroHandler<MembroEntity> {
  final MembroRepository repository;

  AddMembroUsecase(this.repository);

  Future<Either<ErroApp, MembroEntity>> createMembro(
    String instituicaoUid,
    MembroEntity membroEntity,
  ) async {
    var result = await repository.createMembro(instituicaoUid, membroEntity);
    return handleError(result);
  }
}
