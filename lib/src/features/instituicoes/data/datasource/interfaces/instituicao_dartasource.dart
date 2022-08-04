import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:dio/dio.dart';

abstract class InstituicaoDatasource {
  Future<Response> getInstituicoes(Map<String, dynamic> queryParametros);
  Future<Response> getInstituicoesReport(Map<String, dynamic> queryParametros);
  Future<Response> searchInstituicoes(Map<String, dynamic> queryParametros);
  Future<Response> getInstituicao(String uid);
  Future<Response> createInstituicao(InstituicaoEntity instituicao);
  Future<Response> updateInstituicao(InstituicaoEntity instituicao);
  Future<Response> deleteInstituicao(InstituicaoEntity instituicao);
}
