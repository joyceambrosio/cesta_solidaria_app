import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/atividades/data/datasource/interfaces/atividade_datasource.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';

import 'package:dio/dio.dart';

class AtividadeApi extends AtividadeDatasource {
  final DioClient dioClient;
  AtividadeApi(this.dioClient);

  @override
  Future<Response> createAtividade(
    AtividadeEntity atividade,
  ) async {
    var params = atividade.toJson();
    final Response response = await dioClient.post(
      "${Endpoints.atividades}/",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> getAtividades(Map<String, dynamic> queryParams) async {
    final Response response = await dioClient.get("${Endpoints.atividades}/",
        queryParameters: queryParams);
    return response;
  }

  @override
  Future<Response> getAtividade(String atividadeUid) async {
    final Response response =
        await dioClient.get("${Endpoints.atividades}/$atividadeUid");
    return response;
  }
}
