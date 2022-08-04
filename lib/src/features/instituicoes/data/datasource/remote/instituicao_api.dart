import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/instituicoes/data/datasource/interfaces/instituicao_dartasource.dart';

import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:dio/dio.dart';

class InstituicaoApi extends InstituicaoDatasource {
  final DioClient dioClient;

  InstituicaoApi(this.dioClient);
  @override
  Future<Response> createInstituicao(
    InstituicaoEntity instituicao,
  ) async {
    var params = instituicao.toJson();
    final Response response =
        await dioClient.post(Endpoints.instituicoes, data: params);
    return response;
  }

  @override
  Future<Response> deleteInstituicao(
    InstituicaoEntity instituicao,
  ) async {
    final Response response =
        await dioClient.delete("${Endpoints.instituicoes}/${instituicao.id}");
    return response;
  }

  @override
  Future<Response> getInstituicao(
    String uid,
  ) async {
    final Response response =
        await dioClient.get("${Endpoints.instituicoes}/$uid");
    return response;
  }

  @override
  Future<Response> getInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    final Response response = await dioClient.get(
      Endpoints.instituicoes,
      queryParameters: queryParametros,
    );
    return response;
  }

  @override
  Future<Response> getInstituicoesReport(
    Map<String, dynamic> queryParametros,
  ) async {
    final Response response = await dioClient.get(
      '${Endpoints.instituicoes}${Endpoints.report}',
      queryParameters: queryParametros,
    );
    return response;
  }

  @override
  Future<Response> searchInstituicoes(
    Map<String, dynamic> queryParametros,
  ) async {
    final Response response = await dioClient.get(
        "${Endpoints.instituicoes}${Endpoints.search}",
        queryParameters: queryParametros);
    return response;
  }

  @override
  Future<Response> updateInstituicao(
    InstituicaoEntity instituicao,
  ) async {
    var params = instituicao.toJson();
    final Response response = await dioClient
        .patch("${Endpoints.instituicoes}/${instituicao.id}", data: params);
    return response;
  }
}
