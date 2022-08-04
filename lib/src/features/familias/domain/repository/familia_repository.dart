import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class FamiliaRepository {
  Future<Either<ErroApp, FamiliaEntity>> getFamilia(String uid);

  Future<Either<ErroApp, List<FamiliaEntity>>> getFamilias(
    Map<String, dynamic> queryParametros,
  );

  Future<Either<ErroApp, List<FamiliaEntity>>> searchFamilias(
    Map<String, dynamic> queryParametros,
  );

  Future<Either<ErroApp, FamiliaEntity>> createFamilia(
    FamiliaEntity familia,
    XFile? comprovanteRenda,
    XFile? comprovanteEndereco,
  );

  Future<Either<ErroApp, FamiliaEntity>> updateFamilia(
    FamiliaEntity familia,
    XFile? comprovanteRenda,
    XFile? comprovanteEndereco,
  );
}
