import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class PessoaRepository {
  Future<Either<ErroApp, List<PessoaEntity>>> getPessoas(String familiaUid);

  Future<Either<ErroApp, PessoaEntity>> getPessoa(
      String familiaUid, String pessoaUid);

  Future<Either<ErroApp, PessoaEntity>> createPessoa(
    String familiaUid,
    PessoaEntity pessoa,
    XFile? comprovante,
  );

  Future<Either<ErroApp, PessoaEntity>> updatePessoa(
    String familiaUid,
    PessoaEntity pessoa,
    XFile? comprovante,
  );

  Future<Either<ErroApp, void>> removerPessoa(
      String familiaUid, String pessoaUid);
}
