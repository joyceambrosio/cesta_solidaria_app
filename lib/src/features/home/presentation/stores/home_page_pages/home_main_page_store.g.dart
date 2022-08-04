// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_main_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeMainPageStore on _HomeMainPageStore, Store {
  late final _$instituicaoAtom =
      Atom(name: '_HomeMainPageStore.instituicao', context: context);

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

  late final _$_HomeMainPageStoreActionController =
      ActionController(name: '_HomeMainPageStore', context: context);

  @override
  dynamic hasInstituicao() {
    final _$actionInfo = _$_HomeMainPageStoreActionController.startAction(
        name: '_HomeMainPageStore.hasInstituicao');
    try {
      return super.hasInstituicao();
    } finally {
      _$_HomeMainPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
instituicao: ${instituicao}
    ''';
  }
}
