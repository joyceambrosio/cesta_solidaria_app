import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/mixins/coordinate_handler.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/create_atividade_usecase.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/create_report_usecase.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/get_atividade_usecase.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/get_atividades_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';

class AtividadeController with CoordinatesHandler {
  CreateAtividadeUsecase createAtividadeUsecase;
  GetAtividadeUsecase getAtividadeUsecase;
  GetAtividadesUsecase getAtividadesUsecase;
  CreateReportUsecase createReportUsecase;

  AtividadeController(
    this.createAtividadeUsecase,
    this.getAtividadeUsecase,
    this.getAtividadesUsecase,
    this.createReportUsecase,
  );

  create(
    AtividadeEntity atividade,
  ) async {
    AuthStore authStore = Modular.get<AuthStore>();
    InstituicaoEntity? instituicao = await authStore.getInstituicao();
    atividade.instituicaoId = instituicao?.id;

    atividade.local = await getPosicao();
    await createAtividadeUsecase.createAtividade(
      atividade,
    );
  }

  Future<File?> getReport(
    Map<String, dynamic> queryParams,
    List<AtividadeEntity> lista,
  ) async {
    var resultado = await createReportUsecase.relatorio(
      queryParams,
      lista,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<AtividadeEntity?> getAtividade(String atividadeUid) async {
    var resultado = await getAtividadeUsecase.getAtividade(atividadeUid);
    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<List<AtividadeEntity>> getAtividades(
    Map<String, dynamic> queryParams,
  ) async {
    var resultado = await getAtividadesUsecase.getAtividades(queryParams);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }
}
