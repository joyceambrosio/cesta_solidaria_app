import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class EnderecoDatasource {
  Future<Response> createEndereco(
    String familiaUid,
    EnderecoEntity endereco,
  );
  Future<Response> createComprovanteEndereco(
    String familiaUid,
    EnderecoEntity endereco,
    XFile? comprovante,
  );
}
