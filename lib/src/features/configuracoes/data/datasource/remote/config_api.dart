import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/configuracoes/data/datasource/interfaces/config_datasource.dart';
import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';

import 'package:dio/dio.dart';

class ConfigApi extends ConfigDatasource {
  final DioClient dioClient;
  ConfigApi(this.dioClient);

  @override
  Future<Response> setConfig(
    ConfigEntity config,
  ) async {
    var params = config.toJson();
    final Response response = await dioClient.patch(
      "${Endpoints.configs}/${config.id}",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> createConfig(ConfigEntity config) async {
    var params = config.toJson();
    final Response response = await dioClient.post(
      "${Endpoints.configs}/",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> getConfigs() async {
    final Response response = await dioClient.get(Endpoints.configs);
    return response;
  }
}
