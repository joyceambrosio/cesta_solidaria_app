import 'dart:convert';
import 'package:cartallum_app/src/features/cesta/domain/entities/local_entity.dart';

class EnderecoInstituicaoEntity {
  String id;
  String tipoEndereco;
  String pais;
  String cep;
  String estado;
  String cidade;
  String logradouro;
  String? numero;
  String bairro;
  String? complemento;
  String? pontoReferencia;
  Local? local;
  EnderecoInstituicaoEntity({
    required this.id,
    required this.tipoEndereco,
    required this.pais,
    required this.cep,
    required this.estado,
    required this.cidade,
    required this.logradouro,
    this.numero,
    required this.bairro,
    this.complemento,
    this.pontoReferencia,
    this.local,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipoEndereco': tipoEndereco,
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

  factory EnderecoInstituicaoEntity.fromMap(Map<String, dynamic> map) {
    return EnderecoInstituicaoEntity(
      id: map['id'] ?? '',
      tipoEndereco: map['tipoEndereco'] ?? '',
      pais: map['pais'] ?? '',
      cep: map['cep'] ?? '',
      estado: map['estado'] ?? '',
      cidade: map['cidade'] ?? '',
      logradouro: map['logradouro'] ?? '',
      numero: map['numero'] ?? '',
      bairro: map['bairro'] ?? '',
      complemento: map['complemento'] ?? '',
      pontoReferencia: map['pontoReferencia'] ?? '',
      local: map['local']['coordinates'] != null
          ? Local.fromMap(map['local'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoInstituicaoEntity.fromJson(String source) =>
      EnderecoInstituicaoEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EnderecoInstituicaoEntity(id: $id, tipoEndereco: $tipoEndereco, pais: $pais, cep: $cep, estado: $estado, cidade: $cidade, logradouro: $logradouro, numero: $numero, bairro: $bairro, complemento: $complemento, pontoReferencia: $pontoReferencia)';
  }

  String stringMaps() {
    var end = '$pais $estado $cidade $bairro $logradouro, $numero';
    return end;
  }
}
