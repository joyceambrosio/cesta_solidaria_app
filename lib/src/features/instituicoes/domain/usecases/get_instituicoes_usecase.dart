import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/repository/instituicao_repository.dart';
import 'package:dartz/dartz.dart';

class GetInstituicoesUsecase extends ErroHandler<List<InstituicaoEntity>> {
  final InstituicaoRepository repository;

  GetInstituicoesUsecase(this.repository);

  Future<Either<ErroApp, List<InstituicaoEntity>>> getInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    var result = await repository.getInstituicoes(queryParametros);
    return handleError(result);
  }

  Future<Either<ErroApp, List<InstituicaoEntity>>> searchInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    var result = await repository.searchInstituicoes(queryParametros);
    return handleError(result);
  }

  Future<Either<ErroApp, List<InstituicaoEntity>>> getInstituicoesReport(
    Map<String, dynamic> queryParametros,
  ) async {
    var result = await repository.getInstituicoesReport(queryParametros);
    return handleError(result);
  }
}
