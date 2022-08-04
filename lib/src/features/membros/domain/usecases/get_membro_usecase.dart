import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/repository/membro_repository.dart';

import 'package:dartz/dartz.dart';

class GetMembroUsecase extends ErroHandler<MembroEntity> {
  final MembroRepository repository;

  GetMembroUsecase(this.repository);

  Future<Either<ErroApp, MembroEntity>> getMembro(
    String instituicaoUid,
    String membroUid,
  ) async {
    var result = await repository.getMembro(instituicaoUid, membroUid);
    return handleError(result);
  }
}
