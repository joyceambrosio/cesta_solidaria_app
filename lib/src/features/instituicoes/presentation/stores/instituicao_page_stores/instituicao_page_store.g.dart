// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instituicao_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituicaoPageStore on _InstituicaoPageStore, Store {
  late final _$instituicaoAtom =
      Atom(name: '_InstituicaoPageStore.instituicao', context: context);

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

  late final _$isGerandoPdfAtom =
      Atom(name: '_InstituicaoPageStore.isGerandoPdf', context: context);

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
      Atom(name: '_InstituicaoPageStore.pdfPath', context: context);

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

  late final _$membrosLenghtAtom =
      Atom(name: '_InstituicaoPageStore.membrosLenght', context: context);

  @override
  int get membrosLenght {
    _$membrosLenghtAtom.reportRead();
    return super.membrosLenght;
  }

  @override
  set membrosLenght(int value) {
    _$membrosLenghtAtom.reportWrite(value, super.membrosLenght, () {
      super.membrosLenght = value;
    });
  }

  late final _$isLoadingConviteAtom =
      Atom(name: '_InstituicaoPageStore.isLoadingConvite', context: context);

  @override
  bool get isLoadingConvite {
    _$isLoadingConviteAtom.reportRead();
    return super.isLoadingConvite;
  }

  @override
  set isLoadingConvite(bool value) {
    _$isLoadingConviteAtom.reportWrite(value, super.isLoadingConvite, () {
      super.isLoadingConvite = value;
    });
  }

  late final _$_InstituicaoPageStoreActionController =
      ActionController(name: '_InstituicaoPageStore', context: context);

  @override
  dynamic setInstituicao(InstituicaoEntity? instituicao) {
    final _$actionInfo = _$_InstituicaoPageStoreActionController.startAction(
        name: '_InstituicaoPageStore.setInstituicao');
    try {
      return super.setInstituicao(instituicao);
    } finally {
      _$_InstituicaoPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
instituicao: ${instituicao},
isGerandoPdf: ${isGerandoPdf},
pdfPath: ${pdfPath},
membrosLenght: ${membrosLenght},
isLoadingConvite: ${isLoadingConvite}
    ''';
  }
}
