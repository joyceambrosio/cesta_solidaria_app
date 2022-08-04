import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MembroRepository {
  Future<Either<ErroApp, List<MembroEntity>>> getMembros(String instituicaoUid);

  Future<Either<ErroApp, MembroEntity>> getMembro(
      String instituicaoUid, String membroUid);

  Future<Either<ErroApp, MembroEntity>> createMembro(
      String instituicaoUid, MembroEntity membro);

  Future<Either<ErroApp, MembroEntity>> updateMembro(
      String instituicaoUid, MembroEntity membro);

  Future<Either<ErroApp, void>> removerMembro(
      String instituicaoUid, String membroUid);
}
