import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/repository/instituicao_repository.dart';
import 'package:dartz/dartz.dart';

class GetInstituicaoUsecase extends ErroHandler<InstituicaoEntity> {
  final InstituicaoRepository repository;

  GetInstituicaoUsecase(this.repository);

  Future<Either<ErroApp, InstituicaoEntity>> getInstituicao(
    String uid,
  ) async {
    var result = await repository.getInstituicao(uid);
    return handleError(result);
  }
}
