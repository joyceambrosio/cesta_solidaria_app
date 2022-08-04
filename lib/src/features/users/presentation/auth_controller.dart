import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/presenter/atividades_controller.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
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

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final UpdatePasswordUsecase updatePasswordUsecase;
  final GetMeUseCase getMeUseCase;
  final UpdateMeUseCase updateMeUseCase;
  final GetUserUsecase getUserUsecase;
  final GetUsersUsecase getUserUsescase;

  AtividadeController atividadeLog = Modular.get<AtividadeController>();

  AuthController(
    this.signupUseCase,
    this.loginUseCase,
    this.logoutUseCase,
    this.forgotPasswordUseCase,
    this.resetPasswordUseCase,
    this.updatePasswordUsecase,
    this.getMeUseCase,
    this.updateMeUseCase,
    this.getUserUsecase,
    this.getUserUsescase,
  );

  Future<void> signup(
    String nome,
    String email,
    String password,
    String passwordConfirm,
  ) async {
    UserAuthEntity user = UserAuthEntity(
      id: '',
      email: email,
      name: nome,
      miniatura: "",
      password: password,
      passwordConfirm: passwordConfirm,
      photo: "",
      role: "",
    );

    var resultado = await signupUseCase.signup(user);

    resultado.fold((l) {
      SnackApp.error(l.mensagem);
    }, (r) {
      atividadeLog.create(AtividadeEntity(
          criadoEm: DateTime.now(),
          metodo: 'POST',
          level: 'Information',
          result: 'success',
          mensagem: 'usuário criado',
          usuarioId: r.id));
      Future.delayed(const Duration(seconds: 2)).then((_) {
        Modular.to.navigate('/home/');
      });
    });
  }

  Future<UserAuthEntity?> updateMe(String nome, String email) async {
    UserAuthEntity user = await getMe();
    user.email = email;
    user.name = nome;

    var resultado = await updateMeUseCase.updateMe(user);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      logout();
      return null;
    }, (r) {
      atividadeLog.create(AtividadeEntity(
          criadoEm: DateTime.now(),
          metodo: 'PUT',
          level: 'Information',
          result: 'success',
          mensagem: 'usuário modificado',
          usuarioId: r.id));
      return r;
    });
  }

  Future<UserAuthEntity?> updateMyPhoto() async {
    UserAuthEntity user = await getMe();

    final ImagePicker _picker = ImagePicker();

    final XFile? xfile = await _picker.pickImage(source: ImageSource.gallery);

    if (xfile != null) {
      var resultado = await updateMeUseCase.updatePhoto(user, xfile);

      return resultado.fold((l) {
        SnackApp.error(l.mensagem);
        return null;
      }, (r) {
        return r;
      });
    }
    return null;
  }

  Future<void> forgotPassword(String email) async {
    var resultado = await forgotPasswordUseCase.forgotPassword(email);

    resultado.fold((l) {
      SnackApp.error(l.mensagem);
    }, (r) {
      SnackApp.sucess("Código enviado para e-mail. A validade é de 10 minutos");
      Modular.to.pushReplacementNamed('/auth/reset');
    });
  }

  Future<void> resetPassword(
    String codigo,
    String password,
    String passwordConfirm,
  ) async {
    var resultado = await resetPasswordUseCase.resetPassword(
        codigo, password, passwordConfirm);

    resultado.fold((l) {
      SnackApp.error(l.mensagem);
    }, (r) {
      SnackApp.sucess("Senha modificada com sucesso. Realize login novamente.");
      Modular.to.pushReplacementNamed('/auth/');
    });
  }

  Future<void> updatePassword(
    String currentPassword,
    String password,
    String passwordConfirm,
  ) async {
    var resultado = await updatePasswordUsecase.updatePassword(
      currentPassword,
      password,
      passwordConfirm,
    );

    resultado.fold((l) {
      SnackApp.error(l.mensagem);
    }, (r) {
      SnackApp.error("Senha modificada com sucesso");
    });
  }

  Future<void> login(String email, String password) async {
    var resultado = await loginUseCase.login(email, password);

    resultado.fold((l) {
      SnackApp.error(l.mensagem);
    }, (r) {
      SnackApp.sucess("Login realizado com sucesso");
      Future.delayed(const Duration(seconds: 2)).then((_) {
        Modular.to.navigate('/start/intro');
      });
    });
  }

  Future<void> logout() async {
    var resultado = await logoutUseCase.logout();

    resultado.fold((l) {
      SnackApp.error(l.mensagem);
    }, (r) {});
  }

  Future<UserAuthEntity?> getLogged() async {
    var resultado = await getMeUseCase.getMe();
    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<UserAuthEntity> getMe() async {
    var resultado = await handleMe();
    if (resultado == null) {
      SnackApp.sucess(
        "Ocorreu um erro ao recuperar usuário. Realize o login novamente",
      );
      Future.delayed(const Duration(seconds: 2)).then((_) {
        Modular.to.navigate('/auth/');
      });
      return resultado!;
    } else {
      return resultado;
    }
  }

  Future<UserAuthEntity?> handleMe() async {
    var resultado = await getMeUseCase.getMe();

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }

  Future<List<UserAuthEntity>> getUsers() async {
    var resultado = await getUserUsescase.getUsers();

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return [];
    }, (r) {
      return r;
    });
  }

  Future<UserAuthEntity?> getUser(
    String userId,
  ) async {
    var resultado = await getUserUsecase.getUser(userId);

    return resultado.fold((l) {
      SnackApp.error(l.mensagem);
      return null;
    }, (r) {
      return r;
    });
  }
}
