import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class EnderecoRepository {
  Future<Either<ErroApp, EnderecoEntity>> createEndereco(
    String familiaUid,
    EnderecoEntity endereco,
    XFile? comprovante,
  );
}
