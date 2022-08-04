import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase extends ErroHandler<void> {
  final UserAuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<Either<ErroApp, void>> forgotPassword(String email) async {
    var result = await repository.forgotPassword(email);
    return handleError(result);
  }
}
