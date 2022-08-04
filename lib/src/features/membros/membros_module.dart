import 'package:cartallum_app/src/features/membros/data/datasource/remote/membro_api.dart';
import 'package:cartallum_app/src/features/membros/data/infra/membro_infra.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/add_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/get_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/get_membros_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/remove_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/domain/usecases/update_membro_usecase.dart';
import 'package:cartallum_app/src/features/membros/presenter/membro_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

class MembrosModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => MembroApi(i()), export: true),
        Bind.factory((i) => MembroInfra(i()), export: true),
        Bind.factory((i) => AddMembroUsecase(i()), export: true),
        Bind.factory((i) => GetMembroUsecase(i()), export: true),
        Bind.factory((i) => GetMembrosUsecase(i()), export: true),
        Bind.factory((i) => RemoveMembroUsecase(i()), export: true),
        Bind.factory((i) => UpdateMembroUsecase(i()), export: true),
        Bind.lazySingleton((i) => MembroController(i(), i(), i(), i(), i()),
            export: true),
      ];
}
