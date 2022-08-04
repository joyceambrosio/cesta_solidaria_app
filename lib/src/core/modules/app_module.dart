import 'package:cartallum_app/src/core/modules/dio_module.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/core/storage/config_store.dart';
import 'package:cartallum_app/src/features/atividades/atividades_module.dart';
import 'package:cartallum_app/src/features/cesta/cesta_module.dart';
import 'package:cartallum_app/src/features/configuracoes/config_module.dart';
import 'package:cartallum_app/src/features/endereco/endereco_module.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/endereco_module.dart';
import 'package:cartallum_app/src/features/membros/membros_module.dart';
import 'package:cartallum_app/src/features/pessoas/pessoas_module.dart';
import 'package:cartallum_app/src/features/users/users_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cartallum_app/src/core/errors/not_found_page.dart';
import 'package:cartallum_app/src/features/auth/auth_module.dart';
import 'package:cartallum_app/src/features/familias/familia_module.dart';
import 'package:cartallum_app/src/features/home/home_module.dart';
import 'package:cartallum_app/src/features/instituicoes/instituicao_module.dart';
import 'package:cartallum_app/src/features/start/presentation/pages/splash_page.dart';
import 'package:cartallum_app/src/features/start/start_module.dart';
import 'package:get/get.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        DioModule(),
        UsersModule(),
        EnderecoInstituicaoModule(),
        MembrosModule(),
        CestasModule(),
        ConfiguracoesModule(),
        EnderecoModule(),
        PessoasModule(),
        AtividadesModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton<AuthStore>((i) => Get.put(AuthStore())),
        Bind.singleton<ConfigStore>((i) => Get.put(ConfigStore()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/start', module: StartModule()),
        ModuleRoute('/familias', module: FamiliaModule()),
        ModuleRoute('/instituicoes', module: InstituicaoModule()),
        ModuleRoute('/home', module: HomeModule()),
        WildcardRoute(child: (context, args) => const NotFoundPage()),
      ];
}
