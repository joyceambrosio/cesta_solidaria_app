// import 'package:cartallum_app/src/core/storage/secure_storage.dart';

// import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
// import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
// import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

// class StoredUser {
//   final SecureStorage secStore = SecureStorage();
//   final _storage = SecureStorage();

//   UserAuthEntity? user;
//   InstituicaoEntity? instituicao;
//   MembroEntity? roleInstituicao;
//   String token = 'loggedout';

//   setUser(UserAuthEntity? user) async {
//     if (user == null) {
//       await _storage.secureDelete('loggedUser');
//     } else {
//       await _storage.secureWrite('loggedUser', user.toJson());
//     }
//   }

//   Future<UserAuthEntity?> getUser() async {
//     String userStr = await _storage.secureRead('loggedUser');
//     user = UserAuthEntity.fromJson(userStr);
//     return user;
//   }

//   bool hasUser() {
//     return user != null;
//   }

//   setInstituicao(InstituicaoEntity? instituicao) async {
//     if (instituicao == null) {
//       await _storage.secureDelete('instituicaoUser');
//     } else {
//       this.instituicao = instituicao;
//       await _storage.secureWrite('instituicaoUser', instituicao.toJson());
//     }
//   }

//   Future<InstituicaoEntity?> getInstituicao() async {
//     String instituicaoStr = await _storage.secureRead('instituicaoUser');
//     if (instituicaoStr != '') {
//       instituicao = InstituicaoEntity.fromJson(instituicaoStr);
//       return instituicao;
//     }
//     return null;
//   }

//   setRoleInstituicao(MembroEntity? membroEntity) async {
//     if (membroEntity == null) {
//       await _storage.secureDelete('roleInstituicao');
//     } else {
//       roleInstituicao = membroEntity;
//       await _storage.secureWrite('roleInstituicao', membroEntity.toJson());
//     }
//   }

//   Future<MembroEntity?> getRoleInstituicao() async {
//     String roleStr = await _storage.secureRead('roleInstituicao');
//     if (roleStr != '') {
//       roleInstituicao = MembroEntity.fromJson(roleStr);
//       return roleInstituicao;
//     }
//     return null;
//   }

//   Future<bool> hasInstituicao() async {
//     instituicao = await getInstituicao();
//     return instituicao != null;
//   }

//   setToken(String token) async {
//     await _storage.secureWrite('token', token);
//   }

//   Future<String> getToken() async {
//     token = await _storage.secureRead('token');
//     return token;
//   }

//   Future<bool> isLogged() async {
//     String token = await getToken();
//     if (token != '' && token != 'loggedout') {
//       bool hasExpired = JwtDecoder.isExpired(token);
//       return !hasExpired;
//     }
//     return false;
//   }
// }
