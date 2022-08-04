import 'package:cartallum_app/src/features/configuracoes/domain/entities/config_entity.dart';
import 'package:dio/dio.dart';

abstract class ConfigDatasource {
  Future<Response> getConfigs();
  Future<Response> setConfig(ConfigEntity config);
  Future<Response> createConfig(ConfigEntity config);
}
