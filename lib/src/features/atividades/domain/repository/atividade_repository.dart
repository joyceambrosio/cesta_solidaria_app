import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AtividadeRepository {
  Future<Either<ErroApp, AtividadeEntity>> createAtividade(
    AtividadeEntity atividade,
  );
  Future<Either<ErroApp, AtividadeEntity>> getAtividade(String atividadeUid);
  Future<Either<ErroApp, List<AtividadeEntity>>> getAtividades(
    Map<String, dynamic> queryParams,
  );
}
