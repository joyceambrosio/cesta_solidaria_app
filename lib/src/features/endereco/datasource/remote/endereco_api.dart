import 'dart:convert';

import 'package:cartallum_app/src/core/dio/http_client.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../interfaces/endereco_datasource.dart';

class EnderecoApi extends EnderecoDatasource {
  final DioClient dioClient;
  EnderecoApi(this.dioClient);

  @override
  Future<Response> createEndereco(
    String familiaUid,
    EnderecoEntity endereco,
  ) async {
    var params = json.encode({'endereco': endereco.toMap()});

    final Response response = await dioClient.patch(
      "${Endpoints.familias}/$familiaUid/",
      data: params,
    );
    return response;
  }

  @override
  Future<Response> createComprovanteEndereco(
    String familiaUid,
    EnderecoEntity endereco,
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
      "${Endpoints.familias}/$familiaUid/",
      data: formData,
      options: options,
    );
    return response;
  }
}
