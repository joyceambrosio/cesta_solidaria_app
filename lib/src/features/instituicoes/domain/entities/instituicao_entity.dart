import 'dart:convert';

import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';

class InstituicaoEntity {
  String id;
  String nome;
  String sigla;
  String tipo;
  String telefone;
  bool verificado;
  int? cestasAno;
  int? cestasTotal;
  List<EnderecoInstituicaoEntity>? enderecos;
  List<MembroEntity>? membros;
  List<CestaEntity>? cestas;
  List<UserAuthEntity>? usuarios;
  List<FamiliaEntity>? familias;
  InstituicaoEntity({
    required this.id,
    required this.nome,
    required this.sigla,
    required this.tipo,
    required this.telefone,
    required this.verificado,
    this.cestasAno,
    this.cestasTotal,
    this.enderecos,
    this.membros,
    this.cestas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sigla': sigla,
      'tipo': tipo,
      'telefone': telefone,
      'verificado': verificado,
      'enderecos': enderecos?.map((x) => x.toMap()).toList(),
      'membros': membros?.map((x) => x.toMap()).toList(),
    };
  }

  factory InstituicaoEntity.fromMap(Map<String, dynamic> map) {
    return InstituicaoEntity(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      sigla: map['sigla'] ?? '',
      tipo: map['tipo'] ?? '',
      telefone: map['telefone'] ?? '',
      verificado: map['verificado'] ?? false,
      cestasAno: map['cestasAno'] ?? 0,
      cestasTotal: map['cestasTotal'] ?? 0,
      enderecos: map['endereco'] != null
          ? List<EnderecoInstituicaoEntity>.from(
              map['endereco']?.map((x) => EnderecoInstituicaoEntity.fromMap(x)))
          : null,
      membros: map['membros'] != null
          ? List<MembroEntity>.from(map['membros']?.map(
              (x) => MembroEntity.fromMap(x),
            ))
          : null,
      cestas: map['cestas'] != null
          ? List<CestaEntity>.from(map['cestas']?.map(
              (x) => CestaEntity.fromMap(x),
            ))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InstituicaoEntity.fromJson(String source) =>
      InstituicaoEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InstituicaoEntity(id: $id, nome: $nome, sigla: $sigla, tipo: $tipo, telefone: $telefone, enderecos: ${enderecos.toString()}, membros: ${membros.toString()})';
  }
}
