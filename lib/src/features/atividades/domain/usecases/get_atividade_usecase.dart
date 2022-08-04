import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';

import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/domain/repository/atividade_repository.dart';

import 'package:dartz/dartz.dart';

class GetAtividadeUsecase extends ErroHandler<AtividadeEntity> {
  final AtividadeRepository repository;

  GetAtividadeUsecase(this.repository);

  Future<Either<ErroApp, AtividadeEntity>> getAtividade(
    String atividadeUid,
  ) async {
    var result = await repository.getAtividade(atividadeUid);
    return handleError(result);
  }
}
