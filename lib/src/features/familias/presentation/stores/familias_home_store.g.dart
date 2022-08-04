// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'familias_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FamiliasHomeStore on _FamiliasHomeStore, Store {
  late final _$isGerandoPdfAtom =
      Atom(name: '_FamiliasHomeStore.isGerandoPdf', context: context);

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

  late final _$pdfPathAtom =
      Atom(name: '_FamiliasHomeStore.pdfPath', context: context);

  @override
  String? get pdfPath {
    _$pdfPathAtom.reportRead();
    return super.pdfPath;
  }

  @override
  set pdfPath(String? value) {
    _$pdfPathAtom.reportWrite(value, super.pdfPath, () {
      super.pdfPath = value;
    });
  }

  late final _$controllerBuscaAtom =
      Atom(name: '_FamiliasHomeStore.controllerBusca', context: context);

  @override
  TextEditingController get controllerBusca {
    _$controllerBuscaAtom.reportRead();
    return super.controllerBusca;
  }

  @override
  set controllerBusca(TextEditingController value) {
    _$controllerBuscaAtom.reportWrite(value, super.controllerBusca, () {
      super.controllerBusca = value;
    });
  }

  late final _$familiasAtom =
      Atom(name: '_FamiliasHomeStore.familias', context: context);

  @override
  List<FamiliaEntity> get familias {
    _$familiasAtom.reportRead();
    return super.familias;
  }

  @override
  set familias(List<FamiliaEntity> value) {
    _$familiasAtom.reportWrite(value, super.familias, () {
      super.familias = value;
    });
  }

  late final _$familiasLengthAtom =
      Atom(name: '_FamiliasHomeStore.familiasLength', context: context);

  @override
  int get familiasLength {
    _$familiasLengthAtom.reportRead();
    return super.familiasLength;
  }

  @override
  set familiasLength(int value) {
    _$familiasLengthAtom.reportWrite(value, super.familiasLength, () {
      super.familiasLength = value;
    });
  }

  late final _$queryParametrosAtom =
      Atom(name: '_FamiliasHomeStore.queryParametros', context: context);

  @override
  Map<String, dynamic>? get queryParametros {
    _$queryParametrosAtom.reportRead();
    return super.queryParametros;
  }

  @override
  set queryParametros(Map<String, dynamic>? value) {
    _$queryParametrosAtom.reportWrite(value, super.queryParametros, () {
      super.queryParametros = value;
    });
  }

  late final _$limitAtom =
      Atom(name: '_FamiliasHomeStore.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_FamiliasHomeStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$isLastPageAtom =
      Atom(name: '_FamiliasHomeStore.isLastPage', context: context);

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  late final _$filterAmigavelAtom =
      Atom(name: '_FamiliasHomeStore.filterAmigavel', context: context);

  @override
  String get filterAmigavel {
    _$filterAmigavelAtom.reportRead();
    return super.filterAmigavel;
  }

  @override
  set filterAmigavel(String value) {
    _$filterAmigavelAtom.reportWrite(value, super.filterAmigavel, () {
      super.filterAmigavel = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_FamiliasHomeStore.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$isEmptyAtom =
      Atom(name: '_FamiliasHomeStore.isEmpty', context: context);

  @override
  bool get isEmpty {
    _$isEmptyAtom.reportRead();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    _$isEmptyAtom.reportWrite(value, super.isEmpty, () {
      super.isEmpty = value;
    });
  }

  late final _$_FamiliasHomeStoreActionController =
      ActionController(name: '_FamiliasHomeStore', context: context);

  @override
  dynamic setFamilias(List<FamiliaEntity> familias) {
    final _$actionInfo = _$_FamiliasHomeStoreActionController.startAction(
        name: '_FamiliasHomeStore.setFamilias');
    try {
      return super.setFamilias(familias);
    } finally {
      _$_FamiliasHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addAllFamilias(List<FamiliaEntity> familias) {
    final _$actionInfo = _$_FamiliasHomeStoreActionController.startAction(
        name: '_FamiliasHomeStore.addAllFamilias');
    try {
      return super.addAllFamilias(familias);
    } finally {
      _$_FamiliasHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateInstituicao() {
    final _$actionInfo = _$_FamiliasHomeStoreActionController.startAction(
        name: '_FamiliasHomeStore.validateInstituicao');
    try {
      return super.validateInstituicao();
    } finally {
      _$_FamiliasHomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isGerandoPdf: ${isGerandoPdf},
pdfPath: ${pdfPath},
controllerBusca: ${controllerBusca},
familias: ${familias},
familiasLength: ${familiasLength},
queryParametros: ${queryParametros},
limit: ${limit},
page: ${page},
isLastPage: ${isLastPage},
filterAmigavel: ${filterAmigavel},
filter: ${filter},
isEmpty: ${isEmpty}
    ''';
  }
}
