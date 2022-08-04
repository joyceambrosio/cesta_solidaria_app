import 'package:cartallum_app/src/core/storage/auth_error_state.dart';
import 'package:cartallum_app/src/core/storage/secure_storage.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthErrorState error = AuthErrorState();
  final _storage = SecureStorage();

  @observable
  UserAuthEntity? usuario;

  @observable
  InstituicaoEntity? instituicao;

  @observable
  MembroEntity? roleInstituicao;

  @observable
  String? token;

  @action
  init() async {
    await getUser();
    await getInstituicao();
    await getRoleInstituicao();
    await getToken();
  }

  @action
  isAdmin() {
    if (usuario == null) {
      return false;
    }
    return usuario!.role == 'admin';
  }

  @action
  isAdminInstituicao(String instituicaoId) {
    if (usuario == null || roleInstituicao == null || instituicao == null) {
      return false;
    }
    return (roleInstituicao!.instituicao == instituicaoId &&
        roleInstituicao!.role == 'admin' &&
        instituicao!.id == instituicaoId);
  }

  @action
  isAdminOnCurrentInstituicao() {
    if (usuario == null || roleInstituicao == null || instituicao == null) {
      return false;
    }
    return (roleInstituicao!.instituicao == instituicao!.id &&
        roleInstituicao!.role == 'admin' &&
        isActiveOnInstituicao());
  }

  @action
  isInstituicaoMatriz(String instituicaoId) {
    if (usuario == null || roleInstituicao == null || instituicao == null) {
      return false;
    }
    return (roleInstituicao!.instituicao == instituicaoId &&
        roleInstituicao!.role == 'admin' &&
        instituicao!.id == instituicaoId &&
        instituicao!.tipo == 'matriz');
  }

  @action
  isOnInstituicao(String instituicaoId) {
    if (usuario == null || instituicao == null || roleInstituicao == null) {
      return false;
    }
    return (instituicaoId == roleInstituicao!.instituicao);
  }

  @action
  isActiveOnInstituicao() {
    if (usuario == null || instituicao == null || roleInstituicao == null) {
      return false;
    }
    return (instituicao!.verificado &&
        roleInstituicao!.active &&
        instituicao!.id == roleInstituicao!.instituicao);
  }

  @action
  hasAcessoFamilias() {
    if (usuario == null || roleInstituicao == null || instituicao == null) {
      return false;
    }
    return (instituicao!.verificado &&
        roleInstituicao!.active &&
        instituicao!.id == roleInstituicao!.instituicao);
  }

  @action
  hasPermissaoEditarFamilias() {
    if (usuario == null || instituicao == null || instituicao == null) {
      return false;
    }
    return (instituicao!.verificado &&
        roleInstituicao!.role == 'admin' &&
        roleInstituicao!.active &&
        instituicao!.id == roleInstituicao!.instituicao);
  }

  @action
  setToken(String token) async {
    token = token;
    await _storage.secureWrite('token', token);
  }

  @action
  getToken() async {
    token ??= await _storage.secureRead('token');

    if (token != null && token != '' && token != 'loggedout') {
      bool hasExpired = JwtDecoder.isExpired(token!);
      if (hasExpired) {
        token = null;
      }
    }

    return token;
  }

  @action
  setUser(UserAuthEntity? user) async {
    if (user == null) {
      await _storage.secureDelete('loggedUser');
    } else {
      await _storage.secureWrite('loggedUser', user.toJson());
    }
    usuario = user;
  }

  @action
  getUser() async {
    String userStr = await _storage.secureRead('loggedUser');
    if (userStr != '') {
      usuario = UserAuthEntity.fromJson(userStr);
      return usuario;
    }
    return null;
  }

  @action
  isLogged() async {
    usuario = await getUser();
    return usuario != null;
  }

  @action
  Future<InstituicaoEntity?> getInstituicao() async {
    String instituicaoStr = await _storage.secureRead('instituicaoUser');
    if (instituicaoStr != '') {
      instituicao = InstituicaoEntity.fromJson(instituicaoStr);
      return instituicao;
    }
    return null;
  }

  setInstituicao(InstituicaoEntity? instituicao) async {
    if (instituicao == null) {
      await _storage.secureDelete('instituicaoUser');
    } else {
      await _storage.secureWrite('instituicaoUser', instituicao.toJson());
    }
    this.instituicao = instituicao;
  }

  @action
  hasInstituicao() async {
    instituicao = await getInstituicao();
    return instituicao != null;
  }

  @action
  setRoleInstituicao(MembroEntity? membroEntity) async {
    if (membroEntity == null) {
      await _storage.secureDelete('roleInstituicao');
    } else {
      await _storage.secureWrite('roleInstituicao', membroEntity.toJson());
    }
    roleInstituicao = membroEntity;
  }

  @action
  Future<MembroEntity?> getRoleInstituicao() async {
    String roleStr = await _storage.secureRead('roleInstituicao');
    if (roleStr != '') {
      roleInstituicao = MembroEntity.fromJson(roleStr);
      return roleInstituicao;
    }
    return null;
  }

  @action
  validateLoggedUser() async {
    if (usuario == null) {
      error.loggedUser = 'Usuário não logado';
    }
    error.loggedUser = null;
  }
}
