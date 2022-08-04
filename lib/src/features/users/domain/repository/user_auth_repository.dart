import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserAuthRepository {
  Future<Either<ErroApp, UserAuthEntity>> signup(UserAuthEntity user);
  Future<Either<ErroApp, UserAuthEntity>> login(String email, String password);
  Future<Either<ErroApp, void>> logout();

  Future<Either<ErroApp, UserAuthEntity>> getMe();

  Future<Either<ErroApp, UserAuthEntity>> updateMe(UserAuthEntity user);

  Future<Either<ErroApp, UserAuthEntity>> updatePhoto(
    UserAuthEntity user,
    XFile xfile,
  );

  Future<Either<ErroApp, void>> forgotPassword(String email);
  Future<Either<ErroApp, UserAuthEntity>> resetPassword(
    String codigo,
    String password,
    String passwordConfirm,
  );
  Future<Either<ErroApp, UserAuthEntity>> updatePassword(
    String currentPassword,
    String password,
    String passwordConfirm,
  );

  Future<Either<ErroApp, List<UserAuthEntity>>> getUsers();
  Future<Either<ErroApp, UserAuthEntity>> getUser(String userId);
}
