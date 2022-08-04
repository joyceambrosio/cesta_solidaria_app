import 'package:cartallum_app/src/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';

class DioInterceptors extends Interceptor {
  SecureStorage secureStorage = SecureStorage();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var token = await secureStorage.secureRead("token");

    if (token != "loggedout" && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer " + token.toString();
    }

    super.onRequest(options, handler);
  }
}
