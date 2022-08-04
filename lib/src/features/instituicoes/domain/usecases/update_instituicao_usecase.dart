import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/repository/instituicao_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateInstituicaoUsecase extends ErroHandler<InstituicaoEntity> {
  final InstituicaoRepository repository;

  UpdateInstituicaoUsecase(this.repository);

  Future<Either<ErroApp, InstituicaoEntity>> updateInstituicao(
    InstituicaoEntity instituicao,
  ) async {
    var result = await repository.updateInstituicao(instituicao);

    return handleError(result);
  }
}
