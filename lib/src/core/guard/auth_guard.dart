import 'package:cartallum_app/src/core/modules/app_module.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();

    final authStore = Modular.get<AuthStore>();
    bool islogged = await authStore.isLogged();
    if (islogged) {
      final authController = Modular.get<AuthController>();
      UserAuthEntity? user = await authController.getLogged();
      await authStore.init();
      await authStore.setUser(user);
    }
    return islogged;
  }
}
