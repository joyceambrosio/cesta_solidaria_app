import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/repository/familia_repository.dart';
import 'package:dartz/dartz.dart';

class GetFamiliasUsecase extends ErroHandler<List<FamiliaEntity>> {
  final FamiliaRepository repository;
  GetFamiliasUsecase(
    this.repository,
  );

  Future<Either<ErroApp, List<FamiliaEntity>>> getFamilias(
    Map<String, dynamic> queryParametros,
  ) async {
    var result = await repository.getFamilias(queryParametros);
    return handleError(result);
  }

  Future<Either<ErroApp, List<FamiliaEntity>>> searchFamilias(
    Map<String, dynamic> queryParametros,
  ) async {
    var result = await repository.searchFamilias(queryParametros);
    return handleError(result);
  }
}
