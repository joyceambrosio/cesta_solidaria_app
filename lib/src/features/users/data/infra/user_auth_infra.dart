import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:cartallum_app/src/features/users/data/datasource/interfaces/user_auth_datasource.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/domain/repository/user_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cartallum_app/src/core/dio/dio_exceptions.dart';
import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:image_picker/image_picker.dart';

class UserAuthInfra extends UserAuthRepository {
  final UserAuthDatasource datasource;
  final authStore = Modular.get<AuthStore>();

  UserAuthInfra(this.datasource);

  @override
  Future<Either<ErroApp, void>> forgotPassword(String email) async {
    try {
      await datasource.forgotPassword(email);

      return const Right(null);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> getMe() async {
    try {
      final response = await datasource.getMe();
      final usuario = UserAuthEntity.fromMap(response.data['data']['data']);

      await authStore.setUser(usuario);

      return Right(usuario);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await datasource.login(email, password);
      final usuario = UserAuthEntity.fromMap(response.data['data']['user']);
      final token = response.data['token'];

      await authStore.setToken(token);
      await authStore.setUser(usuario);

      return Right(usuario);
    } on DioError catch (e) {
      return Left(ErroApp(mensagem: DioExceptions.fromDioError(e).toString()));
    }
  }

  @override
  Future<Either<ErroApp, void>> logout() async {
    try {
      await datasource.logout();

      await authStore.setToken('loggedout');
      await authStore.setUser(null);
      await authStore.setInstituicao(null);
      await authStore.setRoleInstituicao(null);

      return const Right(null);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> resetPassword(
    String codigo,
    String password,
    String passwordConfirm,
  ) async {
    try {
      final response =
          await datasource.resetPassword(codigo, password, passwordConfirm);
      final usuario = UserAuthEntity.fromMap(response.data['data']['user']);

      return Right(usuario);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> signup(UserAuthEntity user) async {
    try {
      final response = await datasource.signup(user);
      final usuario = UserAuthEntity.fromMap(response.data['data']['user']);
      final token = response.data['token'];

      await authStore.setToken(token);
      await authStore.setUser(usuario);
      await authStore.setInstituicao(null);
      await authStore.setRoleInstituicao(null);

      return Right(usuario);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> updateMe(UserAuthEntity user) async {
    try {
      final response = await datasource.updateMe(user);
      final usuario = UserAuthEntity.fromMap(response.data['data']['user']);

      return Right(usuario);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> updatePassword(
    String currentPassword,
    String password,
    String passwordConfirm,
  ) async {
    try {
      final response = await datasource.updatePassword(
        currentPassword,
        password,
        passwordConfirm,
      );
      final usuario = UserAuthEntity.fromMap(response.data['data']['user']);

      return Right(usuario);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> updatePhoto(
    UserAuthEntity user,
    XFile xfile,
  ) async {
    try {
      final response = await datasource.updatePhoto(user, xfile);
      final usuario = UserAuthEntity.fromMap(response.data['data']['user']);

      return Right(usuario);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, UserAuthEntity>> getUser(String userId) async {
    try {
      final response = await datasource.getUser(userId);
      final list = (response.data['data']['data'] as List)
          .map((e) => UserAuthEntity.fromMap(e))
          .toList();

      return Right(list.first);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }

  @override
  Future<Either<ErroApp, List<UserAuthEntity>>> getUsers() async {
    try {
      final response = await datasource.getUsers();

      final list = (response.data['data']['data'] as List)
          .map((e) => UserAuthEntity.fromMap(e))
          .toList();

      return Right(list);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(ErroApp(mensagem: errorMessage));
    }
  }
}
