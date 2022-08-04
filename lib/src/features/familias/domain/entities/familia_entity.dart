import 'dart:convert';

import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';

class FamiliaEntity {
  String id;
  double renda;
  bool status;
  String motivoStatus;
  DateTime? statusEm;
  DateTime? criadoEm;
  int? pessoasCount = 0;
  int? criancasCount = 0;
  int? cestasCount = 0;

  String? comprovanteRenda;
  DateTime? dataComprovanteRenda;
  String? comprovanteEndereco;
  DateTime? dataComprovanteEndereco;
  EnderecoEntity? endereco;
  List<PessoaEntity>? integrantes;
  List<CestaEntity>? cestas;

  FamiliaEntity({
    required this.id,
    required this.renda,
    required this.status,
    required this.motivoStatus,
    this.statusEm,
    required this.criadoEm,
    this.pessoasCount,
    this.criancasCount,
    this.cestasCount,
    this.comprovanteRenda,
    this.dataComprovanteRenda,
    this.dataComprovanteEndereco,
    this.comprovanteEndereco,
    this.endereco,
    this.integrantes,
    this.cestas,
  });

  double rendaPerCapita() {
    if (pessoasCount != null && pessoasCount != 0 && renda > 0) {
      return (renda / pessoasCount!);
    }
    return 0.0;
  }

  Map<String, dynamic> toMap() {
    var ab = {
      'id': id,
      'renda': renda,
      'status': status,
      'motivoStatus': motivoStatus,
      'statusEm': statusEm?.toIso8601String(),
      'criadoEm': criadoEm?.toIso8601String(),
      'endereco': endereco?.toMap(),
      'integrantes': integrantes?.map((x) => x.toMap()).toList(),
      'cestas': cestas?.map((x) => x.toMap()).toList(),
      'comprovanteRenda': comprovanteRenda,
      'dataComprovanteRenda': dataComprovanteRenda?.toIso8601String(),
      'comprovanteEndereco': comprovanteEndereco,
      'dataComprovanteEndereco': dataComprovanteEndereco?.toIso8601String(),
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);

    return ab;
  }

  factory FamiliaEntity.fromMap(Map<String, dynamic> map) {
    return FamiliaEntity(
      id: map['id'] ?? '',
      renda: map['renda']?.toDouble() ?? 0.0,
      status: map['status'],
      motivoStatus: map['motivoStatus'] ?? '',
      statusEm: DateTime.tryParse(map['statusEm']),
      criadoEm: DateTime.tryParse(map['criadoEm']),
      pessoasCount: map['pessoasCount']?.toInt() ?? 0,
      criancasCount: map['criancasCount']?.toInt() ?? 0,
      cestasCount: map['cestasCount']?.toInt() ?? 0,
      comprovanteRenda: map['comprovanteRenda'] ?? '',
      dataComprovanteRenda:
          DateTime.tryParse(map['dataComprovanteRenda'].toString()),
      comprovanteEndereco: map['comprovanteEndereco'] ?? '',
      dataComprovanteEndereco:
          DateTime.tryParse(map['dataComprovanteEndereco'].toString()),
      endereco: map['endereco'] != null
          ? EnderecoEntity.fromMap(map['endereco'])
          : null,
      integrantes: map['pessoas'] != null
          ? List<PessoaEntity>.from(
              map['pessoas']?.map((x) => PessoaEntity.fromMap(x)))
          : null,
      cestas: map['cestas'] != null
          ? List<CestaEntity>.from(
              map['cestas']?.map((x) => CestaEntity.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FamiliaEntity.fromJson(String source) =>
      FamiliaEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FamiliaEntity(id: $id, renda: $renda, status: $status, motivoStatus: $motivoStatus, statusEm: $statusEm, criadoEm: $criadoEm, pessoasCount: $pessoasCount, criancasCount: $criancasCount, cestasCount: $cestasCount, comprovanteRenda: $comprovanteRenda, dataComprovante: $dataComprovanteRenda, endereco: $endereco, integrantes: $integrantes, cestas: $cestas)';
  }
}
