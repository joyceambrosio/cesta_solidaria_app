import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/create_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/remove_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/update_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/get_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/get_pessoas_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class PessoaController {
  CreatePessoaUsecase createPessoaUsecase;
  GetPessoaUsecase getPessoaUsecase;
  GetPessoasUsecase getPessoasUsecase;
  UpdatePessoaUsecase updatePessoaUsecase;
  RemovePessoaUsecase removePessoaUsecase;

  AtividadeController atividadeLog = Modular.get<AtividadeController>();

  PessoaController(
    this.createPessoaUsecase,
    this.getPessoaUsecase,
    this.getPessoasUsecase,
    this.updatePessoaUsecase,
    this.removePessoaUsecase,
  );

  Future<List<PessoaEntity>> getPessoas(
    String familiaUid,
  ) async {
    var resultado = await getPessoasUsecase.getPessoas(familiaUid);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  Future<PessoaEntity?> getPessoa(
    String familiaUid,
    String pessoaUid,
  ) async {
    var resultado = await getPessoaUsecase.getPessoa(familiaUid, pessoaUid);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<PessoaEntity?> createPessoa(
    String familiaUid,
    PessoaEntity pessoaEntity,
    XFile? comprovante,
  ) async {
    var resultado = await createPessoaUsecase.createPessoa(
      familiaUid,
      pessoaEntity,
      comprovante,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      // atividadeLog.create(AtividadeEntity(
      //   criadoEm: DateTime.now(),
      //   metodo: 'PATCH',
      //   level: 'Information',
      //   result: 'success',
      //   mensagem: 'pessoa criada',
      //   pessoaId: r.id,
      // ));
      return r;
    });
  }

  Future<PessoaEntity?> updatePessoa(
    String familiaUid,
    PessoaEntity pessoaEntity,
    XFile? comprovante,
  ) async {
    var resultado = await updatePessoaUsecase.updatePessoa(
      familiaUid,
      pessoaEntity,
      comprovante,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      // atividadeLog.create(AtividadeEntity(
      //   criadoEm: DateTime.now(),
      //   metodo: 'PATCH',
      //   level: 'Information',
      //   result: 'success',
      //   mensagem: 'pessoa modificada',
      //   pessoaId: r.id,
      // ));
      return r;
    });
  }

  Future<void> removerPessoa(
    String familiaUid,
    String pessoaUid,
  ) async {
    var resultado = await removePessoaUsecase.removerPessoa(
      familiaUid,
      pessoaUid,
    );

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }
}
