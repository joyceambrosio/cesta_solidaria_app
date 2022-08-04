import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:dartz/dartz.dart';

abstract class InstituicaoRepository {
  Future<Either<ErroApp, InstituicaoEntity>> getInstituicao(String uid);

  Future<Either<ErroApp, List<InstituicaoEntity>>> getInstituicoes(
    Map<String, dynamic> queryParametros,
  );

  Future<Either<ErroApp, List<InstituicaoEntity>>> searchInstituicoes(
    Map<String, dynamic> queryParametros,
  );

  Future<Either<ErroApp, List<InstituicaoEntity>>> getInstituicoesReport(
    Map<String, dynamic> queryParametros,
  );

  Future<Either<ErroApp, InstituicaoEntity>> createInstituicao(
      InstituicaoEntity instituicao);

  Future<Either<ErroApp, InstituicaoEntity>> updateInstituicao(
      InstituicaoEntity instituicao);
}
