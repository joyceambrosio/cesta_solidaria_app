import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:cartallum_app/src/features/endereco/domain/repository/endereco_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class CreateEnderecoUsecase extends ErroHandler<EnderecoEntity> {
  final EnderecoRepository repository;

  CreateEnderecoUsecase(this.repository);

  Future<Either<ErroApp, EnderecoEntity>> createEndereco(
    String familiaUid,
    EnderecoEntity endereco,
    XFile? comprovante,
  ) async {
    var result = await repository.createEndereco(
      familiaUid,
      endereco,
      comprovante,
    );
    return handleError(result);
  }
}
