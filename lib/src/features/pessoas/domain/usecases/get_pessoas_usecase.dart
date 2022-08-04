import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:cartallum_app/src/features/pessoas/domain/repository/pessoa_repository.dart';

import 'package:dartz/dartz.dart';

class GetPessoasUsecase extends ErroHandler<List<PessoaEntity>> {
  final PessoaRepository repository;

  GetPessoasUsecase(this.repository);

  Future<Either<ErroApp, List<PessoaEntity>>> getPessoas(
    String familiaUid,
  ) async {
    var result = await repository.getPessoas(familiaUid);
    return handleError(result);
  }
}
