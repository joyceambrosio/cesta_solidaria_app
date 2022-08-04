import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';

import 'package:dartz/dartz.dart';

class GetUsersUsecase extends ErroHandler<List<UserAuthEntity>> {
  final UserAuthRepository repository;

  GetUsersUsecase(this.repository);

  Future<Either<ErroApp, List<UserAuthEntity>>> getUsers() async {
    var result = await repository.getUsers();
    return handleError(result);
  }
}
