import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/repository/familia_repository.dart';
import 'package:dartz/dartz.dart';

class GetFamiliaUsecase extends ErroHandler<FamiliaEntity> {
  final FamiliaRepository repository;
  GetFamiliaUsecase(
    this.repository,
  );

  Future<Either<ErroApp, FamiliaEntity>> getFamilia(
    String uid,
  ) async {
    var result = await repository.getFamilia(uid);
    return handleError(result);
  }
}
