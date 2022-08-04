import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase with ErroHandler {
  final UserAuthRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<ErroApp, void>> logout() async {
    var result = await repository.logout();
    return handleError(result);
  }
}
