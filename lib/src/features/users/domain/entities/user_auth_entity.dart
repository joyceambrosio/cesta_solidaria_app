import 'dart:convert';

import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';

class UserAuthEntity {
  String id;
  String name;
  String email;
  String photo;
  String miniatura;
  String role;
  String password;
  String passwordConfirm;
  List<MembroEntity>? roles;
  UserAuthEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.miniatura,
    required this.role,
    required this.password,
    required this.passwordConfirm,
    this.roles,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'photo': photo,
      'miniatura': miniatura,
      'role': role,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'instituicoes': roles?.map((x) => x.toMap()).toList(),
    }..removeWhere((dynamic key, dynamic value) =>
        key == null || value == null || value == '');
  }

  factory UserAuthEntity.fromMap(Map<String, dynamic> map) {
    return UserAuthEntity(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photo: map['photo'] ?? '',
      miniatura: map['miniatura'] ?? '',
      role: map['role'] ?? '',
      password: map['password'] ?? '',
      passwordConfirm: map['passwordConfirm'] ?? '',
      roles: map['instituicoes'] != null
          ? List<MembroEntity>.from(
              map['instituicoes']?.map((x) => MembroEntity.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());
  factory UserAuthEntity.fromJson(String source) =>
      UserAuthEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserAuthEntity(id: $id, name: $name, email: $email, photo: $photo, miniatura: $miniatura, role: $role, password: $password, passwordConfirm: $passwordConfirm)';
  }
}
