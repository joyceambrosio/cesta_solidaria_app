import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/mixins/coordinate_handler.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:cartallum_app/src/features/endereco/domain/usecases/create_endereco_usecase.dart';
import 'package:image_picker/image_picker.dart';

class EnderecoController with CoordinatesHandler {
  CreateEnderecoUsecase createEnderecoUsecase;
  EnderecoController(
    this.createEnderecoUsecase,
  );

  Future<EnderecoEntity?> createEndereco(
    String familiaUid,
    EnderecoEntity endereco,
    XFile? comprovante,
  ) async {
    endereco.local = await getPosicao();
    var resultado = await createEnderecoUsecase.createEndereco(
      familiaUid,
      endereco,
      comprovante,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }
}
