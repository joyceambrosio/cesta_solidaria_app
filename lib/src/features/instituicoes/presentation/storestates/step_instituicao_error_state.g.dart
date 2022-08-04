// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_instituicao_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepInstituicaoErrorState on _StepInstituicaoErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_StepInstituicaoErrorState.hasErrors'))
          .value;

  late final _$nomeAtom =
      Atom(name: '_StepInstituicaoErrorState.nome', context: context);

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

  late final _$siglaAtom =
      Atom(name: '_StepInstituicaoErrorState.sigla', context: context);

  @override
  String? get sigla {
    _$siglaAtom.reportRead();
    return super.sigla;
  }

  @override
  set sigla(String? value) {
    _$siglaAtom.reportWrite(value, super.sigla, () {
      super.sigla = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_StepInstituicaoErrorState.telefone', context: context);

  @override
  String? get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String? value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  @override
  String toString() {
    return '''
nome: ${nome},
sigla: ${sigla},
telefone: ${telefone},
hasErrors: ${hasErrors}
    ''';
  }
}
