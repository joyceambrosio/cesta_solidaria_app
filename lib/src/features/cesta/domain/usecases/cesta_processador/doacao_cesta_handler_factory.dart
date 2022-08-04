import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/doacao_cesta_handler.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/instituicao_cesta_handler.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/permissao_instituicao_handler.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/permissao_usuario_handler.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/restricao_mais_uma_cesta_dia.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/restricao_numero_cestas_anual.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/restricao_renda.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/cesta_processador/restricao_renda_per_capita.dart';

class DoacaoCestaHandlerFactory {
  DoacaoCestaHandler handler;
  DoacaoCestaHandlerFactory({
    required this.handler,
  });

  static DoacaoCestaHandler restricoesCesta() {
    final restricaoPermissaoUsuario = PermissaoUsuarioHandler();
    final permissaoInstituicaoHandler = PermissaoInstituicaoHandler();
    final restricaoMaisUmaCestaDia = RestricaoMaisUmaCestaDia();
    final instituicaoHandler = InstituicaoCestaHandler();
    final restricaoNumeroCestasAnual = RestricaoNumeroCestasAnual();
    final restricaoRenda = RestricaoRenda();
    final restricaoRendaPerCapita = RestricaoRendaPerCapita();

    restricaoPermissaoUsuario
        .link(permissaoInstituicaoHandler)
        .link(instituicaoHandler)
        .link(restricaoMaisUmaCestaDia)
        .link(restricaoNumeroCestasAnual)
        .link(restricaoRenda)
        .link(restricaoRendaPerCapita);

    return restricaoPermissaoUsuario;
  }
}
