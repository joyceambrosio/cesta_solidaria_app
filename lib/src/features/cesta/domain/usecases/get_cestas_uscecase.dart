import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/repository/cesta_repository.dart';

import 'package:dartz/dartz.dart';

class GetCestasUsecase extends ErroHandler<List<CestaEntity>> {
  final CestaRepository repository;

  GetCestasUsecase(this.repository);

  Future<Either<ErroApp, List<CestaEntity>>> getCestas(
    String instituicaoUid,
  ) async {
    var result = await repository.getCestas(instituicaoUid);
    return handleError(result);
  }
}
