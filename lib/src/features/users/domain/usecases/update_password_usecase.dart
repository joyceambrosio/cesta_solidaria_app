import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';

import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePasswordUsecase extends ErroHandler<UserAuthEntity> {
  final UserAuthRepository repository;

  UpdatePasswordUsecase(this.repository);

  Future<Either<ErroApp, UserAuthEntity>> updatePassword(
    String currentPassword,
    String password,
    String passwordConfirm,
  ) async {
    var result = await repository.updatePassword(
      currentPassword,
      password,
      passwordConfirm,
    );
    return handleError(result);
  }
}
