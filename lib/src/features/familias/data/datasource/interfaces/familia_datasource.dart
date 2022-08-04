import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

abstract class FamiliaDatasource {
  Future<Response> getFamilias(Map<String, dynamic> queryParametros);
  Future<Response> searchFamilias(Map<String, dynamic> queryParametros);
  Future<Response> getFamilia(String uid);
  Future<Response> createFamilia(FamiliaEntity familia);
  Future<Response> updateFamilia(FamiliaEntity familia);
  Future<Response> createComprovanteRenda(
    FamiliaEntity familia,
    XFile? comprovante,
  );
  Future<Response> createComprovanteEndereco(
    FamiliaEntity familia,
    XFile? comprovante,
  );
  Future<Response> deleteFamilia(FamiliaEntity familia);
}
