import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'familia_home_filtro_store.g.dart';

class FamiliaHomeFiltroStore = _FamiliaHomeFiltroStore
    with _$FamiliaHomeFiltroStore;

abstract class _FamiliaHomeFiltroStore with Store {
  @observable
  Map<String, dynamic> queryParametros = {};

  @observable
  TextEditingController controllerBairro = TextEditingController();

  @observable
  TextEditingController controllerCep = TextEditingController();

  @observable
  double? rendaInicial;

  @observable
  double? rendaFinal;

  @observable
  bool? comprovanteRenda = false;

  @observable
  double? idadeInicial;

  @observable
  double? idadeFinal;

  @observable
  double? numeroFamiliares;

  @observable
  double? numeroCriancas;

  @observable
  bool? cestasComDisparidade;

  @observable
  double? cestasUltimosDozeMesesInicial;

  @observable
  double? cestasUltimosDozeMesesFinal;

  @observable
  double? mesesSemReceberCestas;

  @action
  buildFilter() {
    Map<String, dynamic> queryParametros = {
      'renda[gte]': rendaInicial,
      'renda[lte]': rendaFinal,
      // 'comprovante': comprovanteRenda,
      'idade[gte]': idadeInicial == null
          ? null
          : DateTime.now()
              .subtract(Duration(days: (idadeInicial!.toInt() * 365)))
              .toIso8601String(),
      'idade[lte]': idadeFinal == null
          ? null
          : DateTime.now()
              .subtract(Duration(days: (idadeFinal!.toInt() * 365)))
              .toIso8601String(),
      'pessoasCount[lte]': numeroFamiliares,
      'numeroCriancas[lte]': numeroCriancas,
      'cestasComDisparidade': cestasComDisparidade,
      'cestasCount[lte]': cestasUltimosDozeMesesInicial,
      'cestasCount[gte]': cestasUltimosDozeMesesFinal,
      'mesesSemReceberCestas[gte]': mesesSemReceberCestas,
      'bairro': controllerBairro.text,
      'cep': controllerCep.text.replaceAll("-", ""),
      'sort': 'endereco.bairro'
    }..removeWhere(
        (dynamic key, dynamic value) => key == null || value == null);
    if (queryParametros.isEmpty) return null;
    return queryParametros;
  }

  @action
  void validateCep() {
    if (controllerCep.text.isEmpty) {
      cepError = 'Por favor, informe o cep';
      return;
    }
    cepError = null;
  }

  @observable
  String? cepError;
}
