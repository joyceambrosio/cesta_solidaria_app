import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:dio/dio.dart';

abstract class MembroDatasource {
  Future<Response> getMembros(String instituicaoUid);
  Future<Response> getMembro(String instituicaoUid, String uid);
  Future<Response> createMembro(String instituicaoUid, MembroEntity membro);
  Future<Response> updateMembro(String instituicaoUid, MembroEntity membro);
  Future<void> deleteMembro(String instituicaoUid, String membroUid);
}
