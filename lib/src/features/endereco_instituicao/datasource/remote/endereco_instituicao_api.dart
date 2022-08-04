import 'package:dio/dio.dart';

import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/datasource/interfaces/endereco_instituicao_datasource.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';

class EnderecoInstituicaoApi extends EnderecoInstituicaoDatasource {
  final DioClient dioClient;
  EnderecoInstituicaoApi(this.dioClient);

  @override
  Future<Response> createEndereco(
    String instituicaoUid,
    EnderecoInstituicaoEntity endereco,
  ) async {
    var params = endereco.toJson();
    final Response response = await dioClient.post(
      "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.endereco}",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> getEndereco(
    String instituicaoUid,
  ) async {
    final Response response = await dioClient
        .get("${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.endereco}");
    return response;
  }

  @override
  Future<Response> updateEndereco(
    String instituicaoUid,
    EnderecoInstituicaoEntity endereco,
  ) async {
    var params = endereco.toJson();
    final Response response = await dioClient.patch(
      "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.endereco}/${endereco.id}",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> deleteEndereco(
      String instituicaoUid, String enderecoUid) async {
    final Response response = await dioClient.delete(
      "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.endereco}/$enderecoUid",
    );
    return response;
  }
}
