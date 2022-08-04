// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'familia_page_familia_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FamiliaPageFamiliaStore on _FamiliaPageFamiliaStore, Store {
  late final _$familiaAtom =
      Atom(name: '_FamiliaPageFamiliaStore.familia', context: context);

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

  late final _$cestasAtom =
      Atom(name: '_FamiliaPageFamiliaStore.cestas', context: context);

  @override
  List<CestaEntity> get cestas {
    _$cestasAtom.reportRead();
    return super.cestas;
  }

  @override
  set cestas(List<CestaEntity> value) {
    _$cestasAtom.reportWrite(value, super.cestas, () {
      super.cestas = value;
    });
  }

  late final _$cestasLengthAtom =
      Atom(name: '_FamiliaPageFamiliaStore.cestasLength', context: context);

  @override
  int get cestasLength {
    _$cestasLengthAtom.reportRead();
    return super.cestasLength;
  }

  @override
  set cestasLength(int value) {
    _$cestasLengthAtom.reportWrite(value, super.cestasLength, () {
      super.cestasLength = value;
    });
  }

  late final _$queryParametrosAtom =
      Atom(name: '_FamiliaPageFamiliaStore.queryParametros', context: context);

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

  late final _$_FamiliaPageFamiliaStoreActionController =
      ActionController(name: '_FamiliaPageFamiliaStore', context: context);

  @override
  dynamic addCesta(CestaEntity cestaEntity) {
    final _$actionInfo = _$_FamiliaPageFamiliaStoreActionController.startAction(
        name: '_FamiliaPageFamiliaStore.addCesta');
    try {
      return super.addCesta(cestaEntity);
    } finally {
      _$_FamiliaPageFamiliaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFamilia(FamiliaEntity? familia) {
    final _$actionInfo = _$_FamiliaPageFamiliaStoreActionController.startAction(
        name: '_FamiliaPageFamiliaStore.setFamilia');
    try {
      return super.setFamilia(familia);
    } finally {
      _$_FamiliaPageFamiliaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
familia: ${familia},
cestas: ${cestas},
cestasLength: ${cestasLength},
queryParametros: ${queryParametros}
    ''';
  }
}
