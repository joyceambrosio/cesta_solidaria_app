// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_pessoas_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepPessoasErrorState on _StepPessoasErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_StepPessoasErrorState.hasErrors'))
          .value;

  late final _$nomeAtom =
      Atom(name: '_StepPessoasErrorState.nome', context: context);

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

  late final _$cpfAtom =
      Atom(name: '_StepPessoasErrorState.cpf', context: context);

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$dataNascimentoAtom =
      Atom(name: '_StepPessoasErrorState.dataNascimento', context: context);

  @override
  String? get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(String? value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  late final _$sexoAtom =
      Atom(name: '_StepPessoasErrorState.sexo', context: context);

  @override
  String? get sexo {
    _$sexoAtom.reportRead();
    return super.sexo;
  }

  @override
  set sexo(String? value) {
    _$sexoAtom.reportWrite(value, super.sexo, () {
      super.sexo = value;
    });
  }

  late final _$responsavelAtom =
      Atom(name: '_StepPessoasErrorState.responsavel', context: context);

  @override
  String? get responsavel {
    _$responsavelAtom.reportRead();
    return super.responsavel;
  }

  @override
  set responsavel(String? value) {
    _$responsavelAtom.reportWrite(value, super.responsavel, () {
      super.responsavel = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_StepPessoasErrorState.telefone', context: context);

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
cpf: ${cpf},
dataNascimento: ${dataNascimento},
sexo: ${sexo},
responsavel: ${responsavel},
telefone: ${telefone},
hasErrors: ${hasErrors}
    ''';
  }
}
