import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class UserAuthDatasource {
  Future<Response> signup(UserAuthEntity user);
  Future<Response> login(String email, String password);
  Future<Response> logout();
  Future<Response> getMe();
  Future<Response> updateMe(UserAuthEntity user);
  Future<Response> updatePhoto(UserAuthEntity user, XFile xfile);
  Future<Response> forgotPassword(String email);
  Future<Response> resetPassword(
    String codigo,
    String password,
    String passwordConfirm,
  );
  Future<Response> updatePassword(
    String currentPassword,
    String password,
    String passwordConfirm,
  );

  Future<Response> getUsers();
  Future<Response> getUser(String id);
}
