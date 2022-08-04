import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetMeUseCase extends ErroHandler<UserAuthEntity> {
  final UserAuthRepository repository;

  GetMeUseCase(this.repository);

  Future<Either<ErroApp, UserAuthEntity>> getMe() async {
    var result = await repository.getMe();
    return handleError(result);
  }
}
