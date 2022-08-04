import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class UpdateMeUseCase extends ErroHandler<UserAuthEntity> {
  final UserAuthRepository repository;

  UpdateMeUseCase(this.repository);

  Future<Either<ErroApp, UserAuthEntity>> updateMe(
    UserAuthEntity user,
  ) async {
    var result = await repository.updateMe(user);
    return handleError(result);
  }

  Future<Either<ErroApp, UserAuthEntity>> updatePhoto(
    UserAuthEntity user,
    XFile xfile,
  ) async {
    var result = await repository.updatePhoto(user, xfile);
    return handleError(result);
  }
}
