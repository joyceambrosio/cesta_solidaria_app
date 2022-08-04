// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_familia_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepFamiliaErrorState on _TabInstituicaoErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_TabInstituicaoErrorState.hasErrors'))
          .value;

  late final _$rendaAtom =
      Atom(name: '_TabInstituicaoErrorState.renda', context: context);

  @override
  String? get renda {
    _$rendaAtom.reportRead();
    return super.renda;
  }

  @override
  set renda(String? value) {
    _$rendaAtom.reportWrite(value, super.renda, () {
      super.renda = value;
    });
  }

  @override
  String toString() {
    return '''
renda: ${renda},
hasErrors: ${hasErrors}
    ''';
  }
}
