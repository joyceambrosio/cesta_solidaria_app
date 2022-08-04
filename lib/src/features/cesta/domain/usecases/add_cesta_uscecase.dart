import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/cesta/domain/repository/cesta_repository.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/doacao_cesta_handler_factory.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';

import 'package:dartz/dartz.dart';

class AddCestaUsecase extends ErroHandler<CestaEntity> {
  final CestaRepository repository;

  AddCestaUsecase(this.repository);

  Future<Either<ErroApp, CestaEntity>> createCesta(
    String instituicaoUid,
    CestaEntity cestaEntity,
  ) async {
    var result = await repository.createCesta(instituicaoUid, cestaEntity);
    return handleError(result);
  }

  Future<Either<ErroApp, CestaEntity>> preProcessarCesta(
    String instituicaoUid,
    FamiliaEntity familiaEntity,
    CestaEntity cestaEntity,
  ) async {
    try {
      final doacaoCestaHandler = DoacaoCestaHandlerFactory.restricoesCesta();

      await doacaoCestaHandler.processsar(familiaEntity, cestaEntity);
      return Right(cestaEntity);
    } on ErroApp catch (e) {
      return Left(
        ErroApp(mensagem: e.mensagem),
      );
    }
  }
}
