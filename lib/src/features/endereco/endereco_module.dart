import 'package:cartallum_app/src/features/endereco/datasource/infra/endereco_infra.dart';
import 'package:cartallum_app/src/features/endereco/datasource/remote/endereco_api.dart';
import 'package:cartallum_app/src/features/endereco/domain/usecases/create_endereco_usecase.dart';
import 'package:cartallum_app/src/features/endereco/presenter/endereco_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

class EnderecoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => EnderecoApi(i()), export: true),
        Bind.factory((i) => EnderecoInfra(i()), export: true),
        Bind.factory((i) => CreateEnderecoUsecase(i()), export: true),
        Bind.lazySingleton((i) => EnderecoController(i()), export: true),
      ];
}
