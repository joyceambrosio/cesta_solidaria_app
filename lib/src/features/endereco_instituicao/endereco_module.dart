import 'package:cartallum_app/src/features/endereco_instituicao/datasource/infra/endereco_infra.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/datasource/remote/endereco_instituicao_api.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/usecases/create_endereco_usecase.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/usecases/get_endereco_usecase.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/usecases/update_endereco_usecase.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/presenter/endereco_instituicao_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

class EnderecoInstituicaoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => EnderecoInstituicaoApi(i()), export: true),
        Bind.factory((i) => EnderecoInstituicaoInfra(i()), export: true),
        Bind.factory((i) => GetEnderecoInstituicaoUsecase(i()), export: true),
        Bind.factory((i) => CreateEnderecoInstituicaoUsecase(i()),
            export: true),
        Bind.factory((i) => UpdateEnderecoInstituicaoUsecase(i()),
            export: true),
        Bind.lazySingleton((i) => EnderecoInstituicaoController(i(), i(), i()),
            export: true),
      ];
}
