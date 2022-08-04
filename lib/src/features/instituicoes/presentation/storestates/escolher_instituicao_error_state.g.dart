// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escolher_instituicao_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EscolherInstituicaoErrorState on _EscolherInstituicaoErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_EscolherInstituicaoErrorState.hasErrors'))
          .value;

  late final _$instituicaoAtom = Atom(
      name: '_EscolherInstituicaoErrorState.instituicao', context: context);

  @override
  String? get instituicao {
    _$instituicaoAtom.reportRead();
    return super.instituicao;
  }

  @override
  set instituicao(String? value) {
    _$instituicaoAtom.reportWrite(value, super.instituicao, () {
      super.instituicao = value;
    });
  }

  late final _$instituicaoEscolhidaAtom = Atom(
      name: '_EscolherInstituicaoErrorState.instituicaoEscolhida',
      context: context);

  @override
  String? get instituicaoEscolhida {
    _$instituicaoEscolhidaAtom.reportRead();
    return super.instituicaoEscolhida;
  }

  @override
  set instituicaoEscolhida(String? value) {
    _$instituicaoEscolhidaAtom.reportWrite(value, super.instituicaoEscolhida,
        () {
      super.instituicaoEscolhida = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_EscolherInstituicaoErrorState.password', context: context);

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

  @override
  String toString() {
    return '''
instituicao: ${instituicao},
instituicaoEscolhida: ${instituicaoEscolhida},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
