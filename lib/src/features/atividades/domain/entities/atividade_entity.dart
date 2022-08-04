import 'dart:convert';

import 'package:cartallum_app/src/features/cesta/domain/entities/local_entity.dart';

class AtividadeEntity {
  final DateTime criadoEm;
  final String metodo;
  final String level;
  final String result;
  final String mensagem;
  String? usuarioId;
  String? nomeUsuario;
  String? instituicaoId;
  String? nomeInstituicao;
  String? familiaId;
  String? cestaId;
  String? pessoaId;
  Local? local;

  AtividadeEntity({
    required this.criadoEm,
    required this.metodo,
    required this.level,
    required this.result,
    required this.mensagem,
    this.usuarioId,
    this.nomeUsuario,
    this.instituicaoId,
    this.nomeInstituicao,
    this.familiaId,
    this.cestaId,
    this.pessoaId,
    this.local,
  });

  Map<String, dynamic> toMap() {
    return {
      'criadoEm': criadoEm.toIso8601String(),
      'metodo': metodo,
      'level': level,
      'result': result,
      'mensagem': mensagem,
      'usuario': usuarioId,
      'instituicao': instituicaoId,
      'familia': familiaId,
      'pessoa': pessoaId,
      'cesta': cestaId,
      'local': local?.toMap(),
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);
  }

  factory AtividadeEntity.fromMap(Map<String, dynamic> map) {
    return AtividadeEntity(
      criadoEm: DateTime.parse(map['criadoEm']),
      metodo: map['metodo'] ?? '',
      level: map['level'] ?? '',
      result: map['result'] ?? '',
      mensagem: map['mensagem'] ?? '',
      usuarioId: map['usuario'] ?? '',
      nomeUsuario: map['nomeUser'] != null ? map['nomeUser']['name'] : '',
      instituicaoId: map['instituicao'],
      nomeInstituicao:
          map['nomeInstituicao'] != null ? map['nomeInstituicao']['nome'] : '',
      familiaId: map['familia'],
      pessoaId: map['pessoa'],
      cestaId: map['cesta'],
      local: map['local']['coordinates'] != null
          ? Local.fromMap(map['local'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AtividadeEntity.fromJson(String source) =>
      AtividadeEntity.fromMap(json.decode(source));
}
