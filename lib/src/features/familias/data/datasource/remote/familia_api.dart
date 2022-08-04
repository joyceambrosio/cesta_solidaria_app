import 'package:cartallum_app/src/features/familias/data/datasource/interfaces/familia_datasource.dart';
import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class FamiliaApi extends FamiliaDatasource {
  final DioClient dioClient;

  FamiliaApi(this.dioClient);
  @override
  Future<Response> getFamilias(Map<String, dynamic> queryParametros) async {
    final Response response = await dioClient.get(Endpoints.familias,
        queryParameters: queryParametros);
    return response;
  }

  @override
  Future<Response> searchFamilias(Map<String, dynamic> queryParametros) async {
    final Response response = await dioClient.get(
        "${Endpoints.familias}/${Endpoints.search}",
        queryParameters: queryParametros);
    return response;
  }

  @override
  Future<Response> getFamilia(String uid) async {
    final Response response = await dioClient.get("${Endpoints.familias}/$uid");
    return response;
  }

  @override
  Future<Response> deleteFamilia(FamiliaEntity familia) async {
    final Response response =
        await dioClient.delete("${Endpoints.familias}/${familia.id}");
    return response;
  }

  @override
  Future<Response> createFamilia(FamiliaEntity familia) async {
    var params = familia.toJson();
    final Response response =
        await dioClient.post(Endpoints.familias, data: params);
    return response;
  }

  @override
  Future<Response> updateFamilia(FamiliaEntity familia) async {
    var params = familia.toJson();
    final Response response = await dioClient
        .patch("${Endpoints.familias}/${familia.id}", data: params);
    return response;
  }

  @override
  Future<Response> createComprovanteRenda(
    FamiliaEntity familia,
    XFile? comprovante,
  ) async {
    var formData = FormData.fromMap({
      "comprovante": await MultipartFile.fromFile(
        comprovante!.path,
        filename: 'comprovanteRenda',
        contentType: MediaType('image', 'jpeg'),
      )
    });
    var options = Options(contentType: "image/jpeg");

    final Response response = await dioClient.patch(
      "${Endpoints.familias}/${familia.id}",
      data: formData,
      options: options,
    );
    return response;
  }

  @override
  Future<Response> createComprovanteEndereco(
    FamiliaEntity familia,
    XFile? comprovante,
  ) async {
    var formData = FormData.fromMap({
      "comprovante": await MultipartFile.fromFile(
        comprovante!.path,
        filename: 'comprovanteEndereco',
        contentType: MediaType('image', 'jpeg'),
      )
    });
    var options = Options(contentType: "image/jpeg");

    final Response response = await dioClient.patch(
      "${Endpoints.familias}/${familia.id}",
      data: formData,
      options: options,
    );
    return response;
  }
}
