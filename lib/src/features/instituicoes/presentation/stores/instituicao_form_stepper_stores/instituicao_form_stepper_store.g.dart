// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instituicao_form_stepper_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituicaoFormStepperStore on _InstituicaoFormStepperStore, Store {
  late final _$instituicaoAtom =
      Atom(name: '_InstituicaoFormStepperStore.instituicao', context: context);

  @override
  InstituicaoEntity? get instituicao {
    _$instituicaoAtom.reportRead();
    return super.instituicao;
  }

  @override
  set instituicao(InstituicaoEntity? value) {
    _$instituicaoAtom.reportWrite(value, super.instituicao, () {
      super.instituicao = value;
    });
  }

  late final _$isValidAtom =
      Atom(name: '_InstituicaoFormStepperStore.isValid', context: context);

  @override
  bool get isValid {
    _$isValidAtom.reportRead();
    return super.isValid;
  }

  @override
  set isValid(bool value) {
    _$isValidAtom.reportWrite(value, super.isValid, () {
      super.isValid = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_InstituicaoFormStepperStore.isLoading', context: context);

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

  late final _$isLoadingAddMembroAtom = Atom(
      name: '_InstituicaoFormStepperStore.isLoadingAddMembro',
      context: context);

  @override
  bool get isLoadingAddMembro {
    _$isLoadingAddMembroAtom.reportRead();
    return super.isLoadingAddMembro;
  }

  @override
  set isLoadingAddMembro(bool value) {
    _$isLoadingAddMembroAtom.reportWrite(value, super.isLoadingAddMembro, () {
      super.isLoadingAddMembro = value;
    });
  }

  late final _$queryParametrosAtom = Atom(
      name: '_InstituicaoFormStepperStore.queryParametros', context: context);

  @override
  Map<String, dynamic> get queryParametros {
    _$queryParametrosAtom.reportRead();
    return super.queryParametros;
  }

  @override
  set queryParametros(Map<String, dynamic> value) {
    _$queryParametrosAtom.reportWrite(value, super.queryParametros, () {
      super.queryParametros = value;
    });
  }

  late final _$_InstituicaoFormStepperStoreActionController =
      ActionController(name: '_InstituicaoFormStepperStore', context: context);

  @override
  dynamic setInstituicao(InstituicaoEntity? instituicao) {
    final _$actionInfo = _$_InstituicaoFormStepperStoreActionController
        .startAction(name: '_InstituicaoFormStepperStore.setInstituicao');
    try {
      return super.setInstituicao(instituicao);
    } finally {
      _$_InstituicaoFormStepperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPublicUsers(List<UserAuthEntity> users) {
    final _$actionInfo = _$_InstituicaoFormStepperStoreActionController
        .startAction(name: '_InstituicaoFormStepperStore.setPublicUsers');
    try {
      return super.setPublicUsers(users);
    } finally {
      _$_InstituicaoFormStepperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
instituicao: ${instituicao},
isValid: ${isValid},
isLoading: ${isLoading},
isLoadingAddMembro: ${isLoadingAddMembro},
queryParametros: ${queryParametros}
    ''';
  }
}
