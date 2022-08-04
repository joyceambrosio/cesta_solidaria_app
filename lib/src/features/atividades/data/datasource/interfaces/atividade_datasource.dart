import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:dio/dio.dart';

abstract class AtividadeDatasource {
  Future<Response> createAtividade(AtividadeEntity atividade);
  Future<Response> getAtividades(Map<String, dynamic> queryParams);
  Future<Response> getAtividade(String atividadeUid);
}
