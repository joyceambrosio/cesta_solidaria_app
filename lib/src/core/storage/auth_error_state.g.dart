// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthErrorState on _AuthErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_AuthErrorState.hasErrors'))
          .value;

  late final _$loggedUserAtom =
      Atom(name: '_AuthErrorState.loggedUser', context: context);

  @override
  String? get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(String? value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
hasErrors: ${hasErrors}
    ''';
  }
}
