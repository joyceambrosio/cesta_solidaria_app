// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateUserStore on _UpdateUserStore, Store {
  late final _$userAtom = Atom(name: '_UpdateUserStore.user', context: context);

  @override
  UserAuthEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserAuthEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isEditingAtom =
      Atom(name: '_UpdateUserStore.isEditing', context: context);

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_UpdateUserStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$photoAtom =
      Atom(name: '_UpdateUserStore.photo', context: context);

  @override
  String get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(String value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  late final _$controllerRoleAtom =
      Atom(name: '_UpdateUserStore.controllerRole', context: context);

  @override
  TextEditingController get controllerRole {
    _$controllerRoleAtom.reportRead();
    return super.controllerRole;
  }

  @override
  set controllerRole(TextEditingController value) {
    _$controllerRoleAtom.reportWrite(value, super.controllerRole, () {
      super.controllerRole = value;
    });
  }

  late final _$controllerUidAtom =
      Atom(name: '_UpdateUserStore.controllerUid', context: context);

  @override
  TextEditingController get controllerUid {
    _$controllerUidAtom.reportRead();
    return super.controllerUid;
  }

  @override
  set controllerUid(TextEditingController value) {
    _$controllerUidAtom.reportWrite(value, super.controllerUid, () {
      super.controllerUid = value;
    });
  }

  late final _$controllerNomeAtom =
      Atom(name: '_UpdateUserStore.controllerNome', context: context);

  @override
  TextEditingController get controllerNome {
    _$controllerNomeAtom.reportRead();
    return super.controllerNome;
  }

  @override
  set controllerNome(TextEditingController value) {
    _$controllerNomeAtom.reportWrite(value, super.controllerNome, () {
      super.controllerNome = value;
    });
  }

  late final _$controllerEmailAtom =
      Atom(name: '_UpdateUserStore.controllerEmail', context: context);

  @override
  TextEditingController get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  late final _$controllerOldPasswordAtom =
      Atom(name: '_UpdateUserStore.controllerOldPassword', context: context);

  @override
  TextEditingController get controllerOldPassword {
    _$controllerOldPasswordAtom.reportRead();
    return super.controllerOldPassword;
  }

  @override
  set controllerOldPassword(TextEditingController value) {
    _$controllerOldPasswordAtom.reportWrite(value, super.controllerOldPassword,
        () {
      super.controllerOldPassword = value;
    });
  }

  late final _$controllerPasswordAtom =
      Atom(name: '_UpdateUserStore.controllerPassword', context: context);

  @override
  TextEditingController get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  late final _$controllerPasswordConfirmAtom = Atom(
      name: '_UpdateUserStore.controllerPasswordConfirm', context: context);

  @override
  TextEditingController get controllerPasswordConfirm {
    _$controllerPasswordConfirmAtom.reportRead();
    return super.controllerPasswordConfirm;
  }

  @override
  set controllerPasswordConfirm(TextEditingController value) {
    _$controllerPasswordConfirmAtom
        .reportWrite(value, super.controllerPasswordConfirm, () {
      super.controllerPasswordConfirm = value;
    });
  }

  late final _$_UpdateUserStoreActionController =
      ActionController(name: '_UpdateUserStore', context: context);

  @override
  void setUser(UserAuthEntity user) {
    final _$actionInfo = _$_UpdateUserStoreActionController.startAction(
        name: '_UpdateUserStore.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_UpdateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNome() {
    final _$actionInfo = _$_UpdateUserStoreActionController.startAction(
        name: '_UpdateUserStore.validateNome');
    try {
      return super.validateNome();
    } finally {
      _$_UpdateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail() {
    final _$actionInfo = _$_UpdateUserStoreActionController.startAction(
        name: '_UpdateUserStore.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_UpdateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateOldPassword() {
    final _$actionInfo = _$_UpdateUserStoreActionController.startAction(
        name: '_UpdateUserStore.validateOldPassword');
    try {
      return super.validateOldPassword();
    } finally {
      _$_UpdateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword() {
    final _$actionInfo = _$_UpdateUserStoreActionController.startAction(
        name: '_UpdateUserStore.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_UpdateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePasswordConfirm() {
    final _$actionInfo = _$_UpdateUserStoreActionController.startAction(
        name: '_UpdateUserStore.validatePasswordConfirm');
    try {
      return super.validatePasswordConfirm();
    } finally {
      _$_UpdateUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isEditing: ${isEditing},
isLoading: ${isLoading},
photo: ${photo},
controllerRole: ${controllerRole},
controllerUid: ${controllerUid},
controllerNome: ${controllerNome},
controllerEmail: ${controllerEmail},
controllerOldPassword: ${controllerOldPassword},
controllerPassword: ${controllerPassword},
controllerPasswordConfirm: ${controllerPasswordConfirm}
    ''';
  }
}
