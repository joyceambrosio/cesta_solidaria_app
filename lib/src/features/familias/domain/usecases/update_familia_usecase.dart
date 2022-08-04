import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/repository/familia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class UpdateFamiliaUsecase extends ErroHandler<FamiliaEntity> {
  final FamiliaRepository repository;
  UpdateFamiliaUsecase(
    this.repository,
  );

  Future<Either<ErroApp, FamiliaEntity>> updateFamilia(
    FamiliaEntity familia,
    XFile? comprovanteRenda,
    XFile? comprovanteEndereco,
  ) async {
    var result = await repository.updateFamilia(
      familia,
      comprovanteRenda,
      comprovanteEndereco,
    );
    return handleError(result);
  }
}
