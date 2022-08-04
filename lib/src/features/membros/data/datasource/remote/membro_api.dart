import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/membros/data/datasource/interfaces/membro_datasource.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:dio/dio.dart';

class MembroApi extends MembroDatasource {
  final DioClient dioClient;
  MembroApi(this.dioClient);

  @override
  Future<Response> createMembro(
    String instituicaoUid,
    MembroEntity membro,
  ) async {
    var params = membro.toJson();
    final Response response = await dioClient.post(
      "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.membro}/${membro.usuario}",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> getMembros(
    String instituicaoUid,
  ) async {
    final Response response = await dioClient
        .get("${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.membro}");
    return response;
  }

  @override
  Future<Response> getMembro(String instituicaoUid, String uid) async {
    final Response response = await dioClient.get(
        "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.membro}/$uid");
    return response;
  }

  @override
  Future<Response> updateMembro(
    String instituicaoUid,
    MembroEntity membro,
  ) async {
    var params = membro.toJson();
    final Response response = await dioClient.patch(
      "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.membro}/${membro.usuario}",
      data: params,
    );
    return response;
  }

  @override
  Future<void> deleteMembro(String instituicaoUid, String membroUid) async {
    await dioClient.delete(
      "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.membro}/$membroUid",
    );
  }
}
