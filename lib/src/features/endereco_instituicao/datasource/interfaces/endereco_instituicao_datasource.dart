import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:dio/dio.dart';

abstract class EnderecoInstituicaoDatasource {
  Future<Response> getEndereco(String instituicaoUid);

  Future<Response> createEndereco(
    String instituicaoUid,
    EnderecoInstituicaoEntity endereco,
  );
  Future<Response> updateEndereco(
    String instituicaoUid,
    EnderecoInstituicaoEntity endereco,
  );
  Future<Response> deleteEndereco(String instituicaoUid, String enderecoUid);
}
