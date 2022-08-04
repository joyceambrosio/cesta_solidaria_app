import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_dropdown_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/step_endereco_instituicao_store.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepEnderecoInstituicao extends StatelessWidget {
  final InstituicaoController controller;
  final StepEnderecoInstituicaoStore store;

  const StepEnderecoInstituicao({
    required this.controller,
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: Utils.paddingPadrao,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (_) => FormDropDownField(
                    initialValue: store.endereco?.tipoEndereco ?? 'matriz',
                    name: 'tipo',
                    labelText: 'Tipo',
                    hintText: 'Escolha um tipo',
                    errorText: store.error.tipo ?? "",
                    enabled: store.isEdit,
                    isValid: store.error.tipo == null,
                    onChangeAction: (value) {
                      store.tipo = value;
                      store.validateTipo();
                    },
                    lista: Utils.listaTipo,
                  ),
                ),
                Observer(
                  builder: (_) => FormDropDownField(
                    initialValue: store.endereco?.pais ?? 'Brasil',
                    name: 'pais',
                    labelText: 'País',
                    hintText: 'Escolha um país',
                    errorText: store.error.pais ?? "",
                    enabled: false,
                    isValid: true,
                    onChangeAction: (value) {
                      store.pais = value;
                      store.validatePais();
                    },
                    lista: Utils.listaPaises,
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerCep,
                    labelText: "CEP",
                    hintText: "CEP",
                    errorText: store.error.cep ?? '',
                    fieldType: TextInputType.number,
                    enabled: store.isEdit,
                    isValid: store.error.cep == null,
                    validateAction: (value) {
                      store.validateCep();
                    },
                    inputFormatters: [
                      TextInputMask(
                        mask: ['99999-999'],
                        reverse: false,
                      )
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => FormDropDownField(
                    initialValue: store.estado,
                    name: 'uf',
                    labelText: 'UF',
                    hintText: 'Escolha a UF',
                    errorText: store.error.estado ?? '',
                    enabled: store.isEdit,
                    isValid: store.error.estado == null,
                    onChangeAction: (value) {
                      store.estado = value;
                      store.validateEstado();
                    },
                    lista: Utils.listaEstados,
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerCidade,
                    labelText: "Cidade",
                    hintText: "Nome da cidade",
                    errorText: store.error.cidade ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.cidade == null,
                    validateAction: (value) {
                      store.validateCidade();
                    },
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerLogradouro,
                    labelText: "Logradouro",
                    hintText: "Rua, avenida etc...",
                    errorText: store.error.logradouro ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.logradouro == null,
                    validateAction: (value) {
                      store.validateLogradouro();
                    },
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerNumero,
                    labelText: "Número",
                    hintText: "Número",
                    errorText: store.error.numero ?? '',
                    fieldType: TextInputType.number,
                    enabled: store.isEdit,
                    isValid: store.error.numero == null,
                    validateAction: (value) {},
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerBairro,
                    labelText: "Bairro",
                    hintText: "Bairro",
                    errorText: store.error.bairro ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.bairro == null,
                    validateAction: (value) {
                      store.validateBairro();
                    },
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerComplemento,
                    labelText: "Complemento",
                    hintText: "Complemento",
                    errorText: store.error.complemento ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.complemento == null,
                    validateAction: (value) {},
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerPontoReferencia,
                    labelText: "Ponto de referência",
                    hintText: "Ponto de referência",
                    errorText: store.error.pontoReferencia ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.pontoReferencia == null,
                    validateAction: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
