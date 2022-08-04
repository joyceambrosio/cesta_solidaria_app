import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:dio/dio.dart';

abstract class CestaDatasource {
  Future<Response> getCestas(String instituicaoUid);
  Future<Response> getCesta(String instituicaoUid, String uid);
  Future<Response> createCesta(String instituicaoUid, CestaEntity cesta);
}
