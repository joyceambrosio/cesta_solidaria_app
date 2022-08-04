// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instituicoes_home_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituicoesHomeErrorState on _InstituicoesHomeErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_InstituicoesHomeErrorState.hasErrors'))
          .value;

  late final _$buscaAtom =
      Atom(name: '_InstituicoesHomeErrorState.busca', context: context);

  @override
  String? get busca {
    _$buscaAtom.reportRead();
    return super.busca;
  }

  @override
  set busca(String? value) {
    _$buscaAtom.reportWrite(value, super.busca, () {
      super.busca = value;
    });
  }

  @override
  String toString() {
    return '''
busca: ${busca},
hasErrors: ${hasErrors}
    ''';
  }
}
