import 'package:cartallum_app/src/core/dio/dio_interceptors.dart';
import 'package:dio/dio.dart';

class Endpoints {
  Endpoints._();
  static const String baseUrl =
      "https://tranquil-escarpment-43514.herokuapp.com/api/v1";
  //static const String baseUrl = "http://10.0.2.2:3000/api/v1";
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;
  static const String users = '/users';
  static const String familias = '/familias';
  static const String pessoas = '/pessoas';
  static const String endereco = '/endereco';
  static const String enderecosInstituicao = '/enderecosInstituicao';
  static const String instituicoes = '/instituicoes';
  static const String report = '/report';
  static const String membro = '/membros';
  static const String cestas = '/cestas';
  static const String search = '/search';
  static const String atividades = '/atividades';
  static const String configs = '/configuracao';
}

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = Endpoints.baseUrl;
    _dio.options.connectTimeout = Endpoints.connectionTimeout;
    _dio.options.receiveTimeout = Endpoints.receiveTimeout;
    _dio.options.responseType = ResponseType.json;
    _dio.interceptors.add(DioInterceptors());
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
