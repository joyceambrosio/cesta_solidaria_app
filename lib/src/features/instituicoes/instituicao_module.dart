import 'package:cartallum_app/src/features/instituicoes/domain/usecases/create_report_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/atividades_page.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/configuracao_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cartallum_app/src/features/instituicoes/data/datasource/remote/instituicao_api.dart';
import 'package:cartallum_app/src/features/instituicoes/data/infra/instituicao_infra.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/create_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/get_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/get_instituicoes_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/update_instituicao_usecase.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_form_stepper.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_page.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicoes_home_page.dart';

class InstituicaoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => InstituicaoApi(i()), export: true),
        Bind.factory((i) => InstituicaoInfra(i()), export: true),
        Bind.factory((i) => GetInstituicaoUsecase(i()), export: true),
        Bind.factory((i) => GetInstituicoesUsecase(i()), export: true),
        Bind.factory((i) => CreateInstituicaoUsecase(i()), export: true),
        Bind.factory((i) => UpdateInstituicaoUsecase(i()), export: true),
        Bind.factory((i) => CreateReportInstituicaoUsecase(), export: true),
        Bind.lazySingleton(
            (i) => InstituicaoController(i(), i(), i(), i(), i()),
            export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const InstituicoesHomePage(),
            transition: TransitionType.rightToLeft),
        ChildRoute('/instituicao',
            child: (context, args) => InstituicaoFormStepper(
                instituicaoId: args.queryParams['instituicaoId']),
            transition: TransitionType.rightToLeft),
        ChildRoute('/instituicao/:instituicaoId',
            child: (context, args) =>
                InstituicaoPage(instituicaoId: args.params['instituicaoId']),
            transition: TransitionType.rightToLeft),
        ChildRoute('/atividades',
            child: (context, args) => AtividadesPage(
                instituicaoId: args.queryParams['instituicaoId']),
            transition: TransitionType.rightToLeft),
        ChildRoute('/config',
            child: (context, args) => ConfiguracaoPage(),
            transition: TransitionType.rightToLeft),
      ];
}
