import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/add_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/remove_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/update_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/get_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/get_membros_usecase.dart';

class MembroController {
  AddMembroUsecase addMembroUsecase;
  GetMembroUsecase getMembroUsecase;
  GetMembrosUsecase getMembrosUsecase;
  RemoveMembroUsecase removeMembroUsecase;
  UpdateMembroUsecase updateMembroUsecase;

  MembroController(
    this.addMembroUsecase,
    this.getMembroUsecase,
    this.getMembrosUsecase,
    this.removeMembroUsecase,
    this.updateMembroUsecase,
  );

  Future<List<MembroEntity>?> getMembros(
    String instituicaoId,
  ) async {
    var resultado = await getMembrosUsecase.getMembros(instituicaoId);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  Future<MembroEntity?> getMembro(
    String instituicaoId,
    String membroUid,
  ) async {
    var resultado = await getMembroUsecase.getMembro(instituicaoId, membroUid);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<MembroEntity?> addMembro(
    String instituicaoId,
    MembroEntity membro,
  ) async {
    var resultado = await addMembroUsecase.createMembro(instituicaoId, membro);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<void> removeMembro(
    String instituicaoId,
    String membroId,
  ) async {
    var resultado =
        await removeMembroUsecase.removerMembro(instituicaoId, membroId);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<MembroEntity?> updateMembro(
    String instituicaoUid,
    MembroEntity membroEntity,
  ) async {
    var resultado =
        await updateMembroUsecase.updateMembro(instituicaoUid, membroEntity);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }
}
