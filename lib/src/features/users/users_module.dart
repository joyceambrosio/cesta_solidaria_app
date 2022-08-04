import 'package:cartallum_app/src/features/users/data/datasource/remote/user_auth_api.dart';
import 'package:cartallum_app/src/features/users/data/infra/user_auth_infra.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/forgot_password_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/get_me_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/get_user_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/get_users_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/login_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/logout_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/reset_password_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/signup_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/update_me_usecase.dart';
import 'package:cartallum_app/src/features/users/domain/usecases/update_password_usecase.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

class UsersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => UserAuthApi(i()), export: true),
        Bind.factory((i) => UserAuthInfra(i()), export: true),
        Bind.factory((i) => SignupUseCase(i()), export: true),
        Bind.factory((i) => LoginUseCase(i()), export: true),
        Bind.factory((i) => LogoutUseCase(i()), export: true),
        Bind.factory((i) => ForgotPasswordUseCase(i()), export: true),
        Bind.factory((i) => ResetPasswordUseCase(i()), export: true),
        Bind.factory((i) => UpdatePasswordUsecase(i()), export: true),
        Bind.factory((i) => UpdateMeUseCase(i()), export: true),
        Bind.factory((i) => GetUsersUsecase(i()), export: true),
        Bind.factory((i) => GetUserUsecase(i()), export: true),
        Bind.factory((i) => GetMeUseCase(i()), export: true),
        Bind.factory(
            (i) => AuthController(
                i(), i(), i(), i(), i(), i(), i(), i(), i(), i()),
            export: true),
      ];
}
