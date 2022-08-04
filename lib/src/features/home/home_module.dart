import 'package:cartallum_app/src/core/guard/auth_guard.dart';
import 'package:cartallum_app/src/features/auth/auth_module.dart';
import 'package:cartallum_app/src/features/familias/familia_module.dart';
import 'package:cartallum_app/src/features/home/presentation/pages/home_page.dart';
import 'package:cartallum_app/src/features/instituicoes/instituicao_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
        InstituicaoModule(),
        FamiliaModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
          guards: [AuthGuard()],
        ),
        //[ InstituicoesGuard(), AuthGuard()],
      ];
}
