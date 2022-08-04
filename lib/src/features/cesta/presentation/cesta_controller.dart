import 'package:flutter_modular/flutter_modular.dart';

import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/shared/mixins/coordinate_handler.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/add_cesta_uscecase.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/get_cesta_uscecase.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/get_cestas_uscecase.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';

class CestaController with CoordinatesHandler {
  AddCestaUsecase addCestaUsecase;
  GetCestaUsecase getCestaUsecase;
  GetCestasUsecase getCestasUsecase;

  AtividadeController atividadeLog = Modular.get<AtividadeController>();

  CestaController(
    this.addCestaUsecase,
    this.getCestaUsecase,
    this.getCestasUsecase,
  );

  Future<CestaEntity?> addCesta(
    String instituicaoId,
    FamiliaEntity familia,
    CestaEntity cesta,
  ) async {
    cesta.local = await getPosicao();

    var resultado = await addCestaUsecase.createCesta(
      instituicaoId,
      cesta,
    );
    String msgAmigavel = await _mensagemAmigavel(familia);
    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      atividadeLog.create(AtividadeEntity(
          criadoEm: DateTime.now(),
          metodo: 'POST',
          level: 'Information',
          result: 'success',
          mensagem: msgAmigavel,
          instituicaoId: r.instituicao,
          cestaId: r.id,
          familiaId: r.familia));
      return r;
    });
  }

  _mensagemAmigavel(FamiliaEntity familia) async {
    List<String> responsaveis = [];
    if (familia.integrantes != null) {
      if (familia.integrantes!.isNotEmpty) {
        familia.integrantes?.forEach((element) {
          if (element.responsavel) {
            responsaveis.add(
              '${element.nome} (${FormatterApp.fromatCpf(element.cpf)})',
            );
          }
        });
      }
    }

    String mensagem =
        'Cesta doada para o grupo familiar sob responsabilidade de ${responsaveis.join(',')}.';
    return mensagem;
  }

  Future<CestaEntity?> preProcessarCesta(
    String instituicaoId,
    FamiliaEntity familiaEntity,
    CestaEntity cesta,
  ) async {
    cesta.local = await getPosicao();

    var resultado = await addCestaUsecase.preProcessarCesta(
      instituicaoId,
      familiaEntity,
      cesta,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<CestaEntity?> getCesta(
    String instituicaoUid,
    String pessoaUid,
  ) async {
    var resultado = await getCestaUsecase.getCesta(instituicaoUid, pessoaUid);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<List<CestaEntity>> getCestas(String instituicaoUid) async {
    var resultado = await getCestasUsecase.getCestas(instituicaoUid);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }
}
