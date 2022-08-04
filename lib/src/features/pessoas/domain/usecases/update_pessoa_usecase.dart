import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:cartallum_app/src/features/pessoas/domain/repository/pessoa_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePessoaUsecase extends ErroHandler<PessoaEntity> {
  final PessoaRepository repository;

  UpdatePessoaUsecase(this.repository);

  Future<Either<ErroApp, PessoaEntity>> updatePessoa(
    String familiaUid,
    PessoaEntity pessoaEntity,
    XFile? comprovante,
  ) async {
    var result = await repository.updatePessoa(
      familiaUid,
      pessoaEntity,
      comprovante,
    );
    return handleError(result);
  }
}
