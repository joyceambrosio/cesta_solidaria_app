import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase extends ErroHandler<UserAuthEntity> {
  final UserAuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<ErroApp, UserAuthEntity>> signup(
    UserAuthEntity user,
  ) async {
    var result = await repository.signup(user);
    return handleError(result);
  }
}
