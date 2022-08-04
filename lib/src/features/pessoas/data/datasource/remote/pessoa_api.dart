import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/pessoas/data/datasource/interfaces/pessoa_dartasource.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class PessoaApi extends PessoaDatasource {
  final DioClient dioClient;
  PessoaApi(this.dioClient);

  @override
  Future<Response> createPessoa(
    String familiaUid,
    PessoaEntity pesssoa,
  ) async {
    var params = pesssoa.toJson();
    final Response response = await dioClient.post(
      "${Endpoints.familias}/$familiaUid/${Endpoints.pessoas}",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> getPessoas(
    String familiaUid,
  ) async {
    final Response response = await dioClient
        .get("${Endpoints.familias}/$familiaUid/${Endpoints.pessoas}");
    return response;
  }

  @override
  Future<Response> getPessoa(String familiaUid, String uid) async {
    final Response response = await dioClient
        .get("${Endpoints.familias}/$familiaUid/${Endpoints.pessoas}/$uid");
    return response;
  }

  @override
  Future<Response> updatePessoa(
    String familiaUid,
    PessoaEntity pesssoa,
  ) async {
    var params = pesssoa.toJson();
    final Response response = await dioClient.patch(
      "${Endpoints.familias}/$familiaUid/${Endpoints.pessoas}/${pesssoa.id}",
      data: params,
    );
    return response;
  }

  @override
  Future<void> deletePessoa(String familiaUid, String pesssoaUid) async {
    await dioClient.delete(
      "${Endpoints.familias}/$familiaUid/${Endpoints.pessoas}/$pesssoaUid",
    );
  }

  @override
  Future<Response> createComprovante(
    String familiaUid,
    PessoaEntity pessoa,
    XFile? comprovante,
  ) async {
    var formData = FormData.fromMap({
      "comprovante": await MultipartFile.fromFile(
        comprovante!.path,
        filename: comprovante.name,
        contentType: MediaType('image', 'jpeg'),
      )
    });
    var options = Options(contentType: "image/jpeg");

    final Response response = await dioClient.patch(
      "${Endpoints.familias}/$familiaUid/${Endpoints.pessoas}/${pessoa.id}",
      data: formData,
      options: options,
    );
    return response;
  }
}
