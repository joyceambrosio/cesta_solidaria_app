import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/step_instituicao_store.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepInstituicao extends StatelessWidget {
  final InstituicaoController controller;
  final StepInstituicaoStore store;

  const StepInstituicao({
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
                  builder: (_) => FormTextField(
                    controller: store.controllerNome,
                    labelText: "Nome da Instituição",
                    hintText: "Nome da Instituição",
                    errorText: store.error.nome ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.nome == null,
                    validateAction: (value) {
                      store.validateNome();
                    },
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerSigla,
                    labelText: "Sigla da instituição",
                    hintText: "Sigla",
                    errorText: store.error.sigla ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.sigla == null,
                    validateAction: (value) {
                      store.validateSigla();
                    },
                  ),
                ),
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerTelefone,
                    labelText: "Telefone",
                    hintText: "Telefone da instituição",
                    errorText: store.error.telefone ?? '',
                    fieldType: TextInputType.text,
                    enabled: store.isEdit,
                    isValid: store.error.telefone == null,
                    validateAction: (value) {
                      store.validateTelefone();
                    },
                    inputFormatters: [
                      TextInputMask(
                        mask: ['(99) 9999 9999', '(99) 99999 9999'],
                        reverse: false,
                      )
                    ],
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
