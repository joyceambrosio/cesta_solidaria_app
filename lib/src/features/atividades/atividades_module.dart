import 'package:cartallum_app/src/features/atividades/data/datasource/remote/atividade_api.dart';
import 'package:cartallum_app/src/features/atividades/data/infra/atividade_infra.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/create_atividade_usecase.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/get_atividade_usecase.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/get_atividades_usecase.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/create_report_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AtividadesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => AtividadeApi(i()), export: true),
        Bind.factory((i) => AtividadeInfra(i()), export: true),
        Bind.factory((i) => CreateAtividadeUsecase(i()), export: true),
        Bind.factory((i) => GetAtividadeUsecase(i()), export: true),
        Bind.factory((i) => GetAtividadesUsecase(i()), export: true),
        Bind.factory((i) => CreateReportUsecase(), export: true),
        Bind.lazySingleton((i) => AtividadeController(i(), i(), i(), i()),
            export: true),
      ];
}
