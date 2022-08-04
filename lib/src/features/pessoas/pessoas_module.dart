import 'package:cartallum_app/src/features/pessoas/data/datasource/remote/pessoa_api.dart';
import 'package:cartallum_app/src/features/pessoas/data/infra/pessoa_infra.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/create_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/get_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/get_pessoas_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/remove_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/domain/usecases/update_pessoa_usecase.dart';
import 'package:cartallum_app/src/features/pessoas/presenter/pessoa_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

class PessoasModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => PessoaApi(i()), export: true),
        Bind.factory((i) => PessoaInfra(i()), export: true),
        Bind.factory((i) => GetPessoaUsecase(i()), export: true),
        Bind.factory((i) => GetPessoasUsecase(i()), export: true),
        Bind.factory((i) => UpdatePessoaUsecase(i()), export: true),
        Bind.factory((i) => RemovePessoaUsecase(i()), export: true),
        Bind.factory((i) => CreatePessoaUsecase(i()), export: true),
        Bind.lazySingleton((i) => PessoaController(i(), i(), i(), i(), i()),
            export: true),
      ];
}
