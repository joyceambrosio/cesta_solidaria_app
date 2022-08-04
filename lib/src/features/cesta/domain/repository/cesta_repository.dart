import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CestaRepository {
  Future<Either<ErroApp, CestaEntity>> createCesta(
    String instituicaoUid,
    CestaEntity cesta,
  );
  Future<Either<ErroApp, CestaEntity>> getCesta(
    String instituicaoUid,
    String cestaUid,
  );
  Future<Either<ErroApp, List<CestaEntity>>> getCestas(String instituicaoUid);
}
