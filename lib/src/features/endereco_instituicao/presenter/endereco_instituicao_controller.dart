import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/mixins/coordinate_handler.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/usecases/create_endereco_usecase.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/usecases/get_endereco_usecase.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/usecases/update_endereco_usecase.dart';

class EnderecoInstituicaoController with CoordinatesHandler {
  CreateEnderecoInstituicaoUsecase createEnderecoInstituicaoUsecase;
  GetEnderecoInstituicaoUsecase getEnderecoInstituicaoUsecase;
  UpdateEnderecoInstituicaoUsecase updateEnderecoInstituicaoUsecase;
  EnderecoInstituicaoController(
    this.createEnderecoInstituicaoUsecase,
    this.getEnderecoInstituicaoUsecase,
    this.updateEnderecoInstituicaoUsecase,
  );

  Future<EnderecoInstituicaoEntity?> createEnderecoInstituicao(
    String instituicaoUid,
    EnderecoInstituicaoEntity endereco,
  ) async {
    endereco.local = await getPosicao();

    var resultado = await createEnderecoInstituicaoUsecase.createEndereco(
      instituicaoUid,
      endereco,
    );

    return resultado.fold((l) {
      var erro = l.mensagem;
      SnackApp.error(erro);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<EnderecoInstituicaoEntity?> updateEnderecoInstituicao(
    String enderecoUid,
    EnderecoInstituicaoEntity endereco,
  ) async {
    endereco.local = await getPosicao();

    var resultado = await updateEnderecoInstituicaoUsecase
        .updateEnderecoInstituicao(enderecoUid, endereco);

    return resultado.fold((l) {
      var erro = l.mensagem;
      SnackApp.error(erro);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<List<EnderecoInstituicaoEntity?>?> getEnderecoInstituicao(
      String enderecoUid) async {
    var resultado =
        await getEnderecoInstituicaoUsecase.getEnderecoInstituicao(enderecoUid);

    return resultado.fold((l) {
      var erro = l.mensagem;
      SnackApp.error(erro);
      return null;
    }, (r) {
      return r;
    });
  }
}
