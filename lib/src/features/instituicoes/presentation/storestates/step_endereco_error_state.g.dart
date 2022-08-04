// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_endereco_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StepEnderecoErrorState on _StepEnderecoErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_StepEnderecoErrorState.hasErrors'))
          .value;

  late final _$tipoAtom =
      Atom(name: '_StepEnderecoErrorState.tipo', context: context);

  @override
  String? get tipo {
    _$tipoAtom.reportRead();
    return super.tipo;
  }

  @override
  set tipo(String? value) {
    _$tipoAtom.reportWrite(value, super.tipo, () {
      super.tipo = value;
    });
  }

  late final _$paisAtom =
      Atom(name: '_StepEnderecoErrorState.pais', context: context);

  @override
  String? get pais {
    _$paisAtom.reportRead();
    return super.pais;
  }

  @override
  set pais(String? value) {
    _$paisAtom.reportWrite(value, super.pais, () {
      super.pais = value;
    });
  }

  late final _$estadoAtom =
      Atom(name: '_StepEnderecoErrorState.estado', context: context);

  @override
  String? get estado {
    _$estadoAtom.reportRead();
    return super.estado;
  }

  @override
  set estado(String? value) {
    _$estadoAtom.reportWrite(value, super.estado, () {
      super.estado = value;
    });
  }

  late final _$cepAtom =
      Atom(name: '_StepEnderecoErrorState.cep', context: context);

  @override
  String? get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String? value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$cidadeAtom =
      Atom(name: '_StepEnderecoErrorState.cidade', context: context);

  @override
  String? get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String? value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  late final _$logradouroAtom =
      Atom(name: '_StepEnderecoErrorState.logradouro', context: context);

  @override
  String? get logradouro {
    _$logradouroAtom.reportRead();
    return super.logradouro;
  }

  @override
  set logradouro(String? value) {
    _$logradouroAtom.reportWrite(value, super.logradouro, () {
      super.logradouro = value;
    });
  }

  late final _$numeroAtom =
      Atom(name: '_StepEnderecoErrorState.numero', context: context);

  @override
  String? get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String? value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  late final _$bairroAtom =
      Atom(name: '_StepEnderecoErrorState.bairro', context: context);

  @override
  String? get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(String? value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  late final _$complementoAtom =
      Atom(name: '_StepEnderecoErrorState.complemento', context: context);

  @override
  String? get complemento {
    _$complementoAtom.reportRead();
    return super.complemento;
  }

  @override
  set complemento(String? value) {
    _$complementoAtom.reportWrite(value, super.complemento, () {
      super.complemento = value;
    });
  }

  late final _$pontoReferenciaAtom =
      Atom(name: '_StepEnderecoErrorState.pontoReferencia', context: context);

  @override
  String? get pontoReferencia {
    _$pontoReferenciaAtom.reportRead();
    return super.pontoReferencia;
  }

  @override
  set pontoReferencia(String? value) {
    _$pontoReferenciaAtom.reportWrite(value, super.pontoReferencia, () {
      super.pontoReferencia = value;
    });
  }

  @override
  String toString() {
    return '''
tipo: ${tipo},
pais: ${pais},
estado: ${estado},
cep: ${cep},
cidade: ${cidade},
logradouro: ${logradouro},
numero: ${numero},
bairro: ${bairro},
complemento: ${complemento},
pontoReferencia: ${pontoReferencia},
hasErrors: ${hasErrors}
    ''';
  }
}
