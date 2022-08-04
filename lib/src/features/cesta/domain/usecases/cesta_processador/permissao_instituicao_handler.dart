import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/doacao_cesta_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PermissaoInstituicaoHandler extends DoacaoCestaHandler {
  @override
  Future<bool> processsar(FamiliaEntity familia, CestaEntity cesta) async {
    final authStore = Modular.get<AuthStore>();
    final instituicao = await authStore.getInstituicao();

    if (instituicao == null) {
      throw ErroApp(
        mensagem: 'Nenhuma instituição escolhida',
      );
    } else {
      if (!instituicao.verificado) {
        throw ErroApp(
          mensagem: 'Instituição não verificada',
        );
      }
    }
    return verificaProximo(familia, cesta);
  }
}
