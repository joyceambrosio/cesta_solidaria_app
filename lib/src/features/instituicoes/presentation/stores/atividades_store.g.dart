// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividades_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AtividadesStore on _AtividadesStore, Store {
  late final _$isGerandoPdfAtom =
      Atom(name: '_AtividadesStore.isGerandoPdf', context: context);

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
      Atom(name: '_AtividadesStore.pdfPath', context: context);

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
      Atom(name: '_AtividadesStore.controllerBusca', context: context);

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

  late final _$atividadesAtom =
      Atom(name: '_AtividadesStore.atividades', context: context);

  @override
  List<AtividadeEntity> get atividades {
    _$atividadesAtom.reportRead();
    return super.atividades;
  }

  @override
  set atividades(List<AtividadeEntity> value) {
    _$atividadesAtom.reportWrite(value, super.atividades, () {
      super.atividades = value;
    });
  }

  late final _$atividadesLengthAtom =
      Atom(name: '_AtividadesStore.atividadesLength', context: context);

  @override
  int get atividadesLength {
    _$atividadesLengthAtom.reportRead();
    return super.atividadesLength;
  }

  @override
  set atividadesLength(int value) {
    _$atividadesLengthAtom.reportWrite(value, super.atividadesLength, () {
      super.atividadesLength = value;
    });
  }

  late final _$queryParametrosAtom =
      Atom(name: '_AtividadesStore.queryParametros', context: context);

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
      Atom(name: '_AtividadesStore.limit', context: context);

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

  late final _$pageAtom = Atom(name: '_AtividadesStore.page', context: context);

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
      Atom(name: '_AtividadesStore.isLastPage', context: context);

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
      Atom(name: '_AtividadesStore.filterAmigavel', context: context);

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
      Atom(name: '_AtividadesStore.filter', context: context);

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
      Atom(name: '_AtividadesStore.isEmpty', context: context);

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

  late final _$_AtividadesStoreActionController =
      ActionController(name: '_AtividadesStore', context: context);

  @override
  dynamic setAtividades(List<AtividadeEntity> atividades) {
    final _$actionInfo = _$_AtividadesStoreActionController.startAction(
        name: '_AtividadesStore.setAtividades');
    try {
      return super.setAtividades(atividades);
    } finally {
      _$_AtividadesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addAllAtividades(List<AtividadeEntity> atividades) {
    final _$actionInfo = _$_AtividadesStoreActionController.startAction(
        name: '_AtividadesStore.addAllAtividades');
    try {
      return super.addAllAtividades(atividades);
    } finally {
      _$_AtividadesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isGerandoPdf: ${isGerandoPdf},
pdfPath: ${pdfPath},
controllerBusca: ${controllerBusca},
atividades: ${atividades},
atividadesLength: ${atividadesLength},
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
