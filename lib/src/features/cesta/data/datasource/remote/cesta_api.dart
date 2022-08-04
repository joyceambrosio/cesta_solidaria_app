import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/cesta/data/datasource/interfaces/cesta_datasource.dart';
import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';

import 'package:dio/dio.dart';

class CestaApi extends CestaDatasource {
  final DioClient dioClient;
  CestaApi(this.dioClient);

  @override
  Future<Response> createCesta(
    String instituicaoUid,
    CestaEntity cesta,
  ) async {
    var params = cesta.toJson();
    final Response response = await dioClient.post(
      "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.cestas}/${cesta.familia}",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> getCestas(
    String instituicaoUid,
  ) async {
    final Response response = await dioClient
        .get("${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.cestas}");
    return response;
  }

  @override
  Future<Response> getCesta(String instituicaoUid, String uid) async {
    final Response response = await dioClient.get(
        "${Endpoints.instituicoes}/$instituicaoUid/${Endpoints.cestas}/$uid");
    return response;
  }
}
