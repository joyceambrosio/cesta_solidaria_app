// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'familia_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FamiliaPageStore on _FamiliaPageStore, Store {
  late final _$familiaAtom =
      Atom(name: '_FamiliaPageStore.familia', context: context);

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

  late final _$isGerandoPdfAtom =
      Atom(name: '_FamiliaPageStore.isGerandoPdf', context: context);

  @override
  bool get isGerandoPdf {
    _$isGerandoPdfAtom.reportRead();
    return super.isGerandoPdf;
  }

  @override
  set isGerandoPdf(bool value) {
    _$isGerandoPdfAtom.reportWrite(value, super.isGerandoPdf, () {
      super.isGerandoPdf = value;
    });
  }

  late final _$isDoandoCestaAtom =
      Atom(name: '_FamiliaPageStore.isDoandoCesta', context: context);

  @override
  bool get isDoandoCesta {
    _$isDoandoCestaAtom.reportRead();
    return super.isDoandoCesta;
  }

  @override
  set isDoandoCesta(bool value) {
    _$isDoandoCestaAtom.reportWrite(value, super.isDoandoCesta, () {
      super.isDoandoCesta = value;
    });
  }

  late final _$_FamiliaPageStoreActionController =
      ActionController(name: '_FamiliaPageStore', context: context);

  @override
  dynamic setFamilia(FamiliaEntity? familia) {
    final _$actionInfo = _$_FamiliaPageStoreActionController.startAction(
        name: '_FamiliaPageStore.setFamilia');
    try {
      return super.setFamilia(familia);
    } finally {
      _$_FamiliaPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
familia: ${familia},
isGerandoPdf: ${isGerandoPdf},
isDoandoCesta: ${isDoandoCesta}
    ''';
  }
}
