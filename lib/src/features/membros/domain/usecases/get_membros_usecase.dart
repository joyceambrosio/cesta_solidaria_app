import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/repository/membro_repository.dart';

import 'package:dartz/dartz.dart';

class GetMembrosUsecase extends ErroHandler<List<MembroEntity>> {
  final MembroRepository repository;

  GetMembrosUsecase(this.repository);

  Future<Either<ErroApp, List<MembroEntity>>> getMembros(
    String instituicaoUid,
  ) async {
    var result = await repository.getMembros(instituicaoUid);
    return handleError(result);
  }
}
