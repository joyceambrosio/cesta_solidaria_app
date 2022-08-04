import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
      // message = "Request to API server was cancelled";
      // break;
      case DioErrorType.connectTimeout:
      // message = "Connection timeout with API server";
      // break;
      case DioErrorType.receiveTimeout:
        // message = "Receive timeout in connection with API server";
        message =
            "Houve um erro na conexão com o servidor. Tente novamente mais tarde";
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message =
            "Houve um erro na conexão com o servidor. Tente novamente mais tarde";
        // message = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        // message = "Unexpected error occurred";
        message = "Ocorreu um erro inesperado";
        break;
      default:
        message = "Alguma coisa deu errado";
        // message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        // return 'Bad request';
        return error['message'];
      case 401:
        //return 'Unauthorized';
        return error['message'];
      case 403:
        return 'Forbidden';
      case 404:
        // return error['message'];
        return error['message'];
      case 500:
        return error['message'];
      case 502:
        return 'Bad gateway';
      default:
        // return 'Oops something went wrong';
        return 'Alguma coisa deu errado';
    }
  }

  @override
  String toString() => message;
}
