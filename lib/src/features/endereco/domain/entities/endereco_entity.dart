import 'dart:convert';

import 'package:cartallum_app/src/features/cesta/domain/entities/local_entity.dart';

class EnderecoEntity {
  String pais;
  String cep;
  String estado;
  String cidade;
  String logradouro;
  String numero;
  String bairro;
  String complemento;
  String pontoReferencia;
  DateTime criadoEm;
  Local? local;

  EnderecoEntity({
    required this.pais,
    required this.cep,
    required this.estado,
    required this.cidade,
    required this.logradouro,
    required this.numero,
    required this.bairro,
    required this.complemento,
    required this.pontoReferencia,
    required this.criadoEm,
    this.local,
  });

  Map<String, dynamic> toMap() {
    return {
      'pais': pais,
      'cep': cep,
      'estado': estado,
      'cidade': cidade,
      'logradouro': logradouro,
      'numero': numero,
      'bairro': bairro,
      'complemento': complemento,
      'pontoReferencia': pontoReferencia,
      'local': local?.toMap(),
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);
  }

  factory EnderecoEntity.fromMap(Map<String, dynamic> map) {
    return EnderecoEntity(
      pais: map['pais'] ?? '',
      cep: map['cep'] ?? '',
      estado: map['estado'] ?? '',
      cidade: map['cidade'] ?? '',
      logradouro: map['logradouro'] ?? '',
      numero: map['numero'] ?? '',
      bairro: map['bairro'] ?? '',
      complemento: map['complemento'] ?? '',
      pontoReferencia: map['pontoReferencia'] ?? '',
      criadoEm: DateTime.parse(map['criadoEm'].toString()),
      local: map['local']['coordinates'] != null
          ? Local.fromMap(map['local'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoEntity.fromJson(String source) =>
      EnderecoEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EnderecoEntity(pais: $pais, cep: $cep, estado: $estado, cidade: $cidade, logradouro: $logradouro, numero: $numero, bairro: $bairro, complemento: $complemento, pontoReferencia: $pontoReferencia)';
  }

  String stringMaps() {
    var end = '$pais $estado $cidade $bairro $logradouro, $numero';
    return end;
  }

  String printString() {
    var end =
        '$logradouro, $numero\n$bairro - $cidade\n$cep\n$complemento\n$pontoReferencia';
    return end;
  }
}
