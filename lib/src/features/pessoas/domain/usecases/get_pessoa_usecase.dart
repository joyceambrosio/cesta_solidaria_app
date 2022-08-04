import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:cartallum_app/src/features/pessoas/domain/repository/pessoa_repository.dart';

import 'package:dartz/dartz.dart';

class GetPessoaUsecase extends ErroHandler<PessoaEntity> {
  final PessoaRepository repository;

  GetPessoaUsecase(this.repository);

  Future<Either<ErroApp, PessoaEntity>> getPessoa(
    String familiaUid,
    String pessoaUid,
  ) async {
    var result = await repository.getPessoa(familiaUid, pessoaUid);
    return handleError(result);
  }
}
