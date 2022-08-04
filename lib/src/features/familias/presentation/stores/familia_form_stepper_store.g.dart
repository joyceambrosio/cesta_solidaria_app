// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'familia_form_stepper_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FamiliaFormStepperStore on _FamiliaFormStepperStore, Store {
  late final _$familiaAtom =
      Atom(name: '_FamiliaFormStepperStore.familia', context: context);

  @override
  FamiliaEntity? get familia {
    _$familiaAtom.reportRead();
    return super.familia;
  }

  @override
  set familia(FamiliaEntity? value) {
    _$familiaAtom.reportWrite(value, super.familia, () {
      super.familia = value;
    });
  }

  late final _$queryParametrosAtom =
      Atom(name: '_FamiliaFormStepperStore.queryParametros', context: context);

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

  late final _$_FamiliaFormStepperStoreActionController =
      ActionController(name: '_FamiliaFormStepperStore', context: context);

  @override
  dynamic setFamilia(FamiliaEntity? familia) {
    final _$actionInfo = _$_FamiliaFormStepperStoreActionController.startAction(
        name: '_FamiliaFormStepperStore.setFamilia');
    try {
      return super.setFamilia(familia);
    } finally {
      _$_FamiliaFormStepperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
familia: ${familia},
queryParametros: ${queryParametros}
    ''';
  }
}
