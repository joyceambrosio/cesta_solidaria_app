import 'dart:convert';

import 'package:cartallum_app/src/features/cesta/domain/entities/local_entity.dart';

class CestaEntity {
  String id;
  DateTime criadoEm;
  bool divergente;
  String motivoDivergencia;
  String familia;
  String instituicao;
  String? nomeInstituicao;
  Local? local;
  CestaEntity({
    required this.id,
    required this.criadoEm,
    required this.divergente,
    required this.motivoDivergencia,
    required this.familia,
    required this.instituicao,
    this.nomeInstituicao,
    this.local,
  });

  Map<String, dynamic> toMap() {
    return {
      'criadoEm': criadoEm.toIso8601String(),
      'familia': familia,
      'instituicao': instituicao,
      'divergente': divergente,
      'motivoDivergencia': motivoDivergencia,
      'local': local?.toMap(),
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);
  }

  factory CestaEntity.fromMap(Map<String, dynamic> map) {
    return CestaEntity(
      id: map['_id'],
      criadoEm: DateTime.parse(map['criadoEm']),
      familia: map['familia'],
      divergente: map['divergente'],
      motivoDivergencia: map['motivoDivergencia'] ?? '',
      instituicao: map['instituicao'],
      local: map['local']['coordinates'] != null
          ? Local.fromMap(map['local'])
          : null,
      nomeInstituicao: map['nomeInstituicao'] != null
          ? map['nomeInstituicao']['nome'] ?? ''
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CestaEntity.fromJson(String source) =>
      CestaEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CestaEntity(id: $id, criadoEm: $criadoEm, divergente: $divergente, motivoDivergencia: $motivoDivergencia, familia: $familia, instituicao: $instituicao, local: $local)';
  }
}
