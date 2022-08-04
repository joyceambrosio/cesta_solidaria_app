import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DioModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio(), export: true),
        Bind.singleton((i) => DioClient(i()), export: true),
      ];
}
