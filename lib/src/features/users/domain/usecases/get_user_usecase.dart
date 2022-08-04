import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';

import 'package:dartz/dartz.dart';

class GetUserUsecase extends ErroHandler<UserAuthEntity> {
  final UserAuthRepository repository;

  GetUserUsecase(this.repository);

  Future<Either<ErroApp, UserAuthEntity>> getUser(String userId) async {
    var result = await repository.getUser(userId);
    return handleError(result);
  }
}
