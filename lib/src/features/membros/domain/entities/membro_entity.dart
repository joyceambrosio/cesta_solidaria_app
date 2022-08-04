import 'dart:convert';

class MembroEntity {
  String id;
  String role;
  bool active;
  String instituicao;
  String usuario;
  DateTime criadoEm;
  MembroEntity({
    required this.id,
    required this.role,
    required this.active,
    required this.instituicao,
    required this.usuario,
    required this.criadoEm,
  });

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'active': active,
      'instituicao': instituicao,
      'usuario': usuario,
      'criadoEm': criadoEm.toIso8601String(),
    };
  }

  factory MembroEntity.fromMap(Map<String, dynamic> map) {
    return MembroEntity(
      id: map['_id'] ?? '',
      role: map['role'] ?? '',
      active: map['active'] ?? false,
      instituicao: map['instituicao'] ?? '',
      usuario: map['usuario'] ?? '',
      criadoEm: DateTime.parse(map['criadoEm']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MembroEntity.fromJson(String source) =>
      MembroEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MembroEntity(role: $role, active: $active, instituicao: $instituicao, usuario: $usuario)';
  }
}
