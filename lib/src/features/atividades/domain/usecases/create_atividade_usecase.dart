import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/domain/repository/atividade_repository.dart';

import 'package:dartz/dartz.dart';

class CreateAtividadeUsecase extends ErroHandler<AtividadeEntity> {
  final AtividadeRepository repository;

  CreateAtividadeUsecase(this.repository);

  Future<Either<ErroApp, AtividadeEntity>> createAtividade(
    AtividadeEntity atividade,
  ) async {
    var result = await repository.createAtividade(atividade);
    return handleError(result);
  }
}
