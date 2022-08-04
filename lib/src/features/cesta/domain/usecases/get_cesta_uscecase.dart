import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/repository/cesta_repository.dart';

import 'package:dartz/dartz.dart';

class GetCestaUsecase extends ErroHandler<CestaEntity> {
  final CestaRepository repository;

  GetCestaUsecase(this.repository);

  Future<Either<ErroApp, CestaEntity>> getCesta(
    String instituicaoUid,
    String pessoaUid,
  ) async {
    var result = await repository.getCesta(instituicaoUid, pessoaUid);
    return handleError(result);
  }
}
