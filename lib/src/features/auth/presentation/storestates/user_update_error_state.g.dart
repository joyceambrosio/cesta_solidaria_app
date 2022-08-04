// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserUpdateErrorState on _UserUpdateErrorState, Store {
  Computed<bool>? _$hasErrorsUserComputed;

  @override
  bool get hasErrorsUser =>
      (_$hasErrorsUserComputed ??= Computed<bool>(() => super.hasErrorsUser,
              name: '_UserUpdateErrorState.hasErrorsUser'))
          .value;
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_UserUpdateErrorState.hasErrors'))
          .value;

  late final _$nomeAtom =
      Atom(name: '_UserUpdateErrorState.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_UserUpdateErrorState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$oldPasswordAtom =
      Atom(name: '_UserUpdateErrorState.oldPassword', context: context);

  @override
  String? get oldPassword {
    _$oldPasswordAtom.reportRead();
    return super.oldPassword;
  }

  @override
  set oldPassword(String? value) {
    _$oldPasswordAtom.reportWrite(value, super.oldPassword, () {
      super.oldPassword = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_UserUpdateErrorState.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordConfirmAtom =
      Atom(name: '_UserUpdateErrorState.passwordConfirm', context: context);

  @override
  String? get passwordConfirm {
    _$passwordConfirmAtom.reportRead();
    return super.passwordConfirm;
  }

  @override
  set passwordConfirm(String? value) {
    _$passwordConfirmAtom.reportWrite(value, super.passwordConfirm, () {
      super.passwordConfirm = value;
    });
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
oldPassword: ${oldPassword},
password: ${password},
passwordConfirm: ${passwordConfirm},
hasErrorsUser: ${hasErrorsUser},
hasErrors: ${hasErrors}
    ''';
  }
}
