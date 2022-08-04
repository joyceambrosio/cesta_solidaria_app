import 'package:cartallum_app/src/features/auth/presentation/pages/change_password_page.dart';
import 'package:cartallum_app/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:cartallum_app/src/features/auth/presentation/pages/login_page.dart';
import 'package:cartallum_app/src/features/auth/presentation/pages/logout_page.dart';
import 'package:cartallum_app/src/features/auth/presentation/pages/register_page.dart';
import 'package:cartallum_app/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => LoginPage(),
            transition: TransitionType.downToUp),
        ChildRoute('/login',
            child: (context, args) => LoginPage(),
            transition: TransitionType.rightToLeftWithFade),
        ChildRoute('/signin',
            child: (context, args) => RegisterPage(),
            transition: TransitionType.rightToLeftWithFade),
        ChildRoute('/logout',
            child: (context, args) => LogoutPage(),
            transition: TransitionType.rightToLeftWithFade),
        ChildRoute('/forgot',
            child: (context, args) => ForgotPasswordPage(),
            transition: TransitionType.rightToLeftWithFade),
        ChildRoute('/reset',
            child: (context, args) => ResetPasswordPage(),
            transition: TransitionType.rightToLeftWithFade),
        ChildRoute('/changePassword',
            child: (context, args) => const ChangePasswordPage(),
            transition: TransitionType.rightToLeftWithFade),
      ];
}
