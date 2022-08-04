import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/cesta/presentation/cesta_controller.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/presenter/endereco_instituicao_controller.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/create_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/create_report_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/get_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/get_instituicoes_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/update_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/membros/presenter/membro_controller.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:io';

class InstituicaoController {
  final CreateInstituicaoUsecase createInstituicaoUsecase;
  final UpdateInstituicaoUsecase updateInstituicaoUsecase;
  final GetInstituicaoUsecase getInstituicaoUsecase;
  final GetInstituicoesUsecase getInstituicoesUsecase;
  final CreateReportInstituicaoUsecase createReportUseCase;

  final authController = Modular.get<AuthController>();
  final controllerEndereco = Modular.get<EnderecoInstituicaoController>();
  final membroController = Modular.get<MembroController>();
  final cestaController = Modular.get<CestaController>();
  final familiaController = Modular.get<FamiliaController>();
  final authStore = Modular.get<AuthStore>();

  AtividadeController atividadeLog = Modular.get<AtividadeController>();

  InstituicaoController(
    this.createInstituicaoUsecase,
    this.updateInstituicaoUsecase,
    this.getInstituicaoUsecase,
    this.getInstituicoesUsecase,
    this.createReportUseCase,
  );

  Future<List<InstituicaoEntity>> getInstituicoesReport(
    Map<String, dynamic> queryParametros,
  ) async {
    var resultado = await getInstituicoesUsecase.getInstituicoesReport(
      queryParametros,
    );

    return resultado.fold((l) {
      return [];
    }, (r) {
      return r;
    });
  }

  getFamiliasByCestas(InstituicaoEntity instituicao) async {
    if (instituicao.cestas != null) {
      if (instituicao.cestas!.isNotEmpty) {
        Set familiasIds = Set.from(instituicao.cestas!.map(
          (e) => e.familia,
        ));

        instituicao.familias = [];
        for (var element in familiasIds) {
          FamiliaEntity? familia = await familiaController.getFamilia(element);
          if (familia != null) instituicao.familias!.add(familia);
        }
      }
    }
    return instituicao;
  }

  getFamiliasECestas(List<InstituicaoEntity> instituicoes) async {
    if (instituicoes.isNotEmpty) {
      for (var instituicao in instituicoes) {
        instituicao = await getFamiliasByCestas(instituicao);
      }
    }
    return instituicoes;
  }

  getMembrosEUsuarios(List<InstituicaoEntity> instituicoes) async {
    if (instituicoes.isNotEmpty) {
      for (var instituicao in instituicoes) {
        instituicao.membros = await membroController.getMembros(instituicao.id);
        if (instituicao.membros != null) {
          instituicao.usuarios = [];
          for (var membro in instituicao.membros!) {
            var user = await authController.getUser(membro.usuario);
            if (user != null) instituicao.usuarios!.add(user);
          }
        }
      }
    }
    return instituicoes;
  }

  Future<File?> getReport() async {
    Map<String, dynamic> queryParametros = {};

    List<InstituicaoEntity> instituicoes = await getInstituicoesReport(
      queryParametros,
    );

    instituicoes = await getFamiliasECestas(instituicoes);
    instituicoes = await getMembrosEUsuarios(instituicoes);

    var resultado = await createReportUseCase.relatorioGruposInstituicoes(
      instituicoes,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<File?> getReportSimples(
    InstituicaoEntity instituicao,
  ) async {
    var resultado =
        await createReportUseCase.relatorioInstituicaoSimples(instituicao);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<InstituicaoEntity?> createInstituicao(
    InstituicaoEntity novaInstituicao,
  ) async {
    var resultado =
        await createInstituicaoUsecase.createInstituicao(novaInstituicao);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      // atividadeLog.create(AtividadeEntity(
      //   criadoEm: DateTime.now(),
      //   metodo: 'POST',
      //   level: 'Information',
      //   result: 'success',
      //   mensagem: 'instituição criada',
      //   instituicaoId: r.id,
      // ));
      return r;
    });
  }

  Future<InstituicaoEntity?> updateInstituicao(
    InstituicaoEntity updateInstituicao,
  ) async {
    var resultado =
        await updateInstituicaoUsecase.updateInstituicao(updateInstituicao);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      // atividadeLog.create(AtividadeEntity(
      //   criadoEm: DateTime.now(),
      //   metodo: 'PATCH',
      //   level: 'Information',
      //   result: 'success',
      //   mensagem: 'instituição modificada',
      //   instituicaoId: r.id,
      // ));
      return r;
    });
  }

  Future<InstituicaoEntity?> getInstituicao(String idInstituicao) async {
    var resultado = await getInstituicaoUsecase.getInstituicao(idInstituicao);
    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<List<InstituicaoEntity>> getInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    var resultado =
        await getInstituicoesUsecase.getInstituicoes(queryParametros);

    return resultado.fold((l) {
      return [];
    }, (r) {
      return r;
    });
  }

  Future<List<InstituicaoEntity>> searchInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    var resultado =
        await getInstituicoesUsecase.searchInstituicoes(queryParametros);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  Future<InstituicaoEntity?> getInstituicaoOfLoggedUser() async {
    InstituicaoEntity? instituicao = await authStore.getInstituicao();
    if (instituicao == null) {
      List<InstituicaoEntity> lista = await getInstituicoesOfLoggedUser();
      if (lista.length == 1) {
        setInstituicaoOfLoggedUser(lista.first);
        return instituicao;
      }
    }

    if (instituicao != null) {
      var resultado =
          await getInstituicaoUsecase.getInstituicao(instituicao.id);

      return resultado.fold((l) {
        authStore.instituicao = null;
        authStore.roleInstituicao = null;
        //SnackApp.error(l.mensagem);
        return null;
      }, (r) {
        return r;
      });
    }
    return null;
  }

  Future<List<InstituicaoEntity>> getInstituicoesOfLoggedUser() async {
    final authController = Modular.get<AuthController>();

    UserAuthEntity? user = await authController.getMe();
    authStore.setUser(user);

    Map<String, dynamic> queryParametros = {};

    if (user.roles != null) {
      if (user.roles!.isNotEmpty) {
        queryParametros = {
          '_id[in]': user.roles?.map((e) => e.instituicao).join(',').toString(),
        };
      } else {
        return [];
      }
    }

    var resultado =
        await getInstituicoesUsecase.getInstituicoes(queryParametros);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  setInstituicaoOfLoggedUser(InstituicaoEntity? instituicaoEntity) async {
    try {
      if (await authStore.isLogged()) {
        authStore.setInstituicao(instituicaoEntity);

        UserAuthEntity? user = await authStore.getUser();

        if (user != null && instituicaoEntity != null) {
          MembroEntity? papel = await membroController.getMembro(
            instituicaoEntity.id,
            user.id,
          );
          authStore.setInstituicao(instituicaoEntity);
          authStore.setRoleInstituicao(papel);
        }

        SnackApp.sucess("Instituição escolhida com sucesso");
        // Modular.to.navigate('/home/');
      }
    } catch (e) {
      SnackApp.sucess("Houve um erro inesperado. Faça o login novamente");
    }
  }
}
