import 'dart:convert';

import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/users/data/datasource/interfaces/user_auth_datasource.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class UserAuthApi extends UserAuthDatasource {
  final DioClient dioClient;
  UserAuthApi(
    this.dioClient,
  );
  @override
  Future<Response> forgotPassword(String email) async {
    var data = {"email": email};
    var params = const JsonEncoder().convert(data);
    final Response response = await dioClient
        .post("${Endpoints.users}/forgotPasswordCode", data: params);
    return response;
  }

  @override
  Future<Response> getMe() async {
    final Response response = await dioClient.get("${Endpoints.users}/me");
    return response;
  }

  @override
  Future<Response> login(String email, String password) async {
    var data = {"email": email, "password": password};
    var params = const JsonEncoder().convert(data);
    final Response response =
        await dioClient.post("${Endpoints.users}/login", data: params);
    return response;
  }

  @override
  Future<Response> logout() async {
    final Response response = await dioClient.get("${Endpoints.users}/logout");
    return response;
  }

  @override
  Future<Response> resetPassword(
    String codigo,
    String password,
    String passwordConfirm,
  ) async {
    var data = {
      "password": password,
      "passwordConfirm": passwordConfirm,
    };
    var params = const JsonEncoder().convert(data);
    final Response response = await dioClient
        .patch("${Endpoints.users}/resetPassword/$codigo", data: params);

    return response;
  }

  @override
  Future<Response> signup(UserAuthEntity user) async {
    var params = user.toJson();
    final Response response =
        await dioClient.post("${Endpoints.users}/signup", data: params);
    return response;
  }

  @override
  Future<Response> updateMe(UserAuthEntity user) async {
    var params = user.toMap();
    params.removeWhere(
        (key, value) => key == "passwordConfirm" || key == "password");

    final Response response =
        await dioClient.patch("${Endpoints.users}/updateMe", data: params);
    return response;
  }

  @override
  Future<Response> updatePhoto(UserAuthEntity user, XFile xfile) async {
    var formData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(
        xfile.path,
        filename: xfile.name,
        contentType: MediaType('image', 'jpeg'),
      )
    });

    var options = Options(contentType: "image/jpeg");

    final Response response = await dioClient.patch(
      "${Endpoints.users}/updateMe",
      data: formData,
      options: options,
    );
    return response;
  }

  @override
  Future<Response> updatePassword(
    String currentPassword,
    String password,
    String passwordConfirm,
  ) async {
    var data = {
      "passwordCurrent": currentPassword,
      "password": password,
      "passwordConfirm": passwordConfirm,
    };
    var params = const JsonEncoder().convert(data);
    final Response response = await dioClient.patch(
      "${Endpoints.users}/updateMyPassword",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> getUser(String id) async {
    Map<String, String> queryParametros = {
      '_id': id,
    };
    final Response response = await dioClient.get(
      "${Endpoints.users}/autocomplete",
      queryParameters: queryParametros,
    );
    return response;
  }

  @override
  Future<Response> getUsers() async {
    final Response response =
        await dioClient.get("${Endpoints.users}/autocomplete");
    return response;
  }
}
