import 'dart:convert';

class PessoaEntity {
  String id;
  String nome;
  String? cpf;
  DateTime dataNascimento;
  int? idade;
  String sexo;
  bool responsavel;
  String? telefone;
  String? comprovante;
  DateTime? dataComprovante;

  PessoaEntity({
    required this.id,
    required this.nome,
    this.cpf,
    required this.dataNascimento,
    this.idade,
    required this.sexo,
    required this.responsavel,
    this.telefone,
    this.comprovante,
    this.dataComprovante,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'dataNascimento': dataNascimento.millisecondsSinceEpoch,
      'sexo': sexo,
      'responsavel': responsavel,
      'telefone': telefone,
      'comprovante': comprovante,
      'dataComprovante': dataComprovante?.toIso8601String(),
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);
  }

  factory PessoaEntity.fromMap(Map<String, dynamic> map) {
    return PessoaEntity(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      cpf: map['cpf'] ?? '',
      dataNascimento: DateTime.parse(map['dataNascimento']),
      idade: map['idade'] ?? 0,
      sexo: map['sexo'] ?? '',
      responsavel: map['responsavel'] ?? false,
      telefone: map['telefone'] ?? '',
      comprovante: map['comprovante'] ?? '',
      dataComprovante: DateTime.tryParse(map['dataComprovante'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory PessoaEntity.fromJson(String source) =>
      PessoaEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PessoaEntity(id: $id, nome: $nome, cpf: $cpf, dataNascimento: $dataNascimento, idade: $idade, sexo: $sexo, responsavel: $responsavel, telefone: $telefone)';
  }
}
