// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_membros_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepMembrosErrorState on _StepMembrosErrorState, Store {
  Computed<bool>? _$nameHasErrorsComputed;

  @override
  bool get nameHasErrors =>
      (_$nameHasErrorsComputed ??= Computed<bool>(() => super.nameHasErrors,
              name: '_StepMembrosErrorState.nameHasErrors'))
          .value;
  Computed<bool>? _$uidhasErrorsComputed;

  @override
  bool get uidhasErrors =>
      (_$uidhasErrorsComputed ??= Computed<bool>(() => super.uidhasErrors,
              name: '_StepMembrosErrorState.uidhasErrors'))
          .value;
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_StepMembrosErrorState.hasErrors'))
          .value;

  late final _$nomeAtom =
      Atom(name: '_StepMembrosErrorState.nome', context: context);

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

  late final _$uidAtom =
      Atom(name: '_StepMembrosErrorState.uid', context: context);

  @override
  String? get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String? value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  late final _$roleAtom =
      Atom(name: '_StepMembrosErrorState.role', context: context);

  @override
  String? get role {
    _$roleAtom.reportRead();
    return super.role;
  }

  @override
  set role(String? value) {
    _$roleAtom.reportWrite(value, super.role, () {
      super.role = value;
    });
  }

  @override
  String toString() {
    return '''
nome: ${nome},
uid: ${uid},
role: ${role},
nameHasErrors: ${nameHasErrors},
uidhasErrors: ${uidhasErrors},
hasErrors: ${hasErrors}
    ''';
  }
}
