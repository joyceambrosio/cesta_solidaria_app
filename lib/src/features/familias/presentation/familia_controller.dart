import 'dart:io';

import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/cesta/presentation/cesta_controller.dart';
import 'package:cartallum_app/src/features/endereco/presenter/endereco_controller.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/create_familia_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/create_report_familia_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/get_familia_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/get_familias_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/update_familia_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/presenter/pessoa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class FamiliaController {
  final GetFamiliasUsecase recuperarFamiliasUsecase;
  final GetFamiliaUsecase recuperarFamiliaUsecase;
  final CreateFamiliaUsecase createFamiliaUsecase;
  final UpdateFamiliaUsecase updateFamiliaUsecase;
  final CreateReportFamiliaUsecase createReportUsecase;

  final enderecoController = Modular.get<EnderecoController>();
  final pessoaController = Modular.get<PessoaController>();
  final cestaController = Modular.get<CestaController>();

  AtividadeController atividadeLog = Modular.get<AtividadeController>();

  FamiliaController(
    this.recuperarFamiliasUsecase,
    this.recuperarFamiliaUsecase,
    this.createFamiliaUsecase,
    this.updateFamiliaUsecase,
    this.createReportUsecase,
  );

  Future<File?> getReport(
    Map<String, dynamic> queryParams,
    List<FamiliaEntity> lista,
  ) async {
    var resultado = await createReportUsecase.relatorioGruposFamiliares(
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

  Future<File?> getRelatorioFamiliaSimples(
    FamiliaEntity familia,
  ) async {
    var resultado = await createReportUsecase.relatorioFamiliaSimples(familia);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<List<FamiliaEntity>> getFamilias(
    Map<String, dynamic> queryParametros,
  ) async {
    var resultado = await recuperarFamiliasUsecase.getFamilias(queryParametros);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  Future<List<FamiliaEntity>> searchFamilias(
    Map<String, dynamic> queryParametros,
  ) async {
    var resultado =
        await recuperarFamiliasUsecase.searchFamilias(queryParametros);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  Future<FamiliaEntity?> getFamilia(String idFamilia) async {
    var resultado = await recuperarFamiliaUsecase.getFamilia(idFamilia);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<FamiliaEntity?> createFamilia(
    FamiliaEntity novaFamilia,
    XFile? comprovanteRenda,
    XFile? comprovanteEndereco,
  ) async {
    novaFamilia.endereco = null;
    var resultado = await createFamiliaUsecase.createFamilia(
      novaFamilia,
      comprovanteRenda,
      comprovanteEndereco,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      // atividadeLog.create(AtividadeEntity(
      //   criadoEm: DateTime.now(),
      //   metodo: 'POST',
      //   level: 'Information',
      //   result: 'success',
      //   mensagem: 'familia criada',
      //   familiaId: r.id,
      // ));
      return r;
    });
  }

  Future<FamiliaEntity?> updateFamilia(
    FamiliaEntity novaFamilia,
    XFile? comprovanteRenda,
    XFile? comprovanteEndereco,
  ) async {
    var resultado = await updateFamiliaUsecase.updateFamilia(
      novaFamilia,
      comprovanteRenda,
      comprovanteEndereco,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      // atividadeLog.create(AtividadeEntity(
      //   criadoEm: DateTime.now(),
      //   metodo: 'POST',
      //   level: 'Information',
      //   result: 'success',
      //   mensagem: 'familia modificada',
      //   familiaId: r.id,
      // ));
      return r;
    });
  }
}
