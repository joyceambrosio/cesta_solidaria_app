import 'package:cartallum_app/src/core/guard/auth_guard.dart';
import 'package:cartallum_app/src/features/start/presentation/pages/introducao_page.dart';
import 'package:cartallum_app/src/features/start/presentation/pages/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute('/intro',
            child: (context, args) => const IntroducaoPage(),
            guards: [AuthGuard()]),
      ];
}
