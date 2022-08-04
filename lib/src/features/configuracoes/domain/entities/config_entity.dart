import 'dart:convert';

class ConfigEntity {
  String id;
  String descricao;
  String mensagemErro;
  bool usa;
  bool restringe;
  double limite;

  ConfigEntity({
    required this.id,
    required this.descricao,
    required this.mensagemErro,
    required this.usa,
    required this.restringe,
    required this.limite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'mensagemErro': mensagemErro,
      'usa': usa,
      'restringe': restringe,
      'limite': limite,
    };
  }

  factory ConfigEntity.fromMap(Map<String, dynamic> map) {
    return ConfigEntity(
      id: map['id'] ?? '',
      descricao: map['descricao'] ?? '',
      mensagemErro: map['mensagemErro'] ?? '',
      usa: map['usa'] ?? false,
      restringe: map['restringe'] ?? false,
      limite: map['limite']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigEntity.fromJson(String source) =>
      ConfigEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConfigEntity(id: $id, descricao: $descricao, mensagemErro: $mensagemErro, usa: $usa, restringe: $restringe, limite: $limite)';
  }
}
