import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class PessoaDatasource {
  Future<Response> getPessoas(String familiaUid);
  Future<Response> getPessoa(String familiaUid, String uid);
  Future<Response> createPessoa(String familiaUid, PessoaEntity pesssoa);
  Future<Response> updatePessoa(String familiaUid, PessoaEntity pesssoa);
  Future<Response> createComprovante(
    String familiaUid,
    PessoaEntity pessoa,
    XFile? comprovante,
  );
  Future<void> deletePessoa(String familiaUid, String pesssoaUid);
}
