import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/image_tile_collapse_removable.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_dropdown_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_form_stepper_store.dart';
import 'package:cartallum_app/src/features/familias/presentation/widgets/pessoa_listtile.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class StepPessoas extends StatelessWidget {
  final FamiliaController controller;
  final FamiliaFormStepperStore store;

  const StepPessoas({
    required this.controller,
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.paddingPadrao,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Observer(
            builder: (_) => FormTextField(
              controller: store.pessoasStore.controllerNome,
              labelText: "Nome completo",
              hintText: "Nome completo",
              errorText: store.pessoasStore.error.nome ?? '',
              fieldType: TextInputType.text,
              enabled: store.pessoasStore.isEdit,
              isValid: store.pessoasStore.error.nome == null,
              validateAction: (value) {
                store.pessoasStore.validateNome();
              },
            ),
          ),
          Observer(
            builder: (_) => FormTextField(
              controller: store.pessoasStore.controllerCpf,
              labelText: "Cpf",
              hintText: "Cpf",
              errorText: store.pessoasStore.error.cpf ?? '',
              fieldType: TextInputType.text,
              enabled: store.pessoasStore.isEdit,
              isValid: store.pessoasStore.error.cpf == null,
              validateAction: (value) {
                store.pessoasStore.validateCpf();
              },
              inputFormatters: [
                TextInputMask(
                  mask: ['999.999.999-99'],
                  reverse: false,
                )
              ],
            ),
          ),
          Observer(
            builder: (_) => FormTextField(
              controller: store.pessoasStore.controllerDataNascimento,
              labelText: "Data de nascimento",
              hintText: "Data de nascimento",
              errorText: store.pessoasStore.error.dataNascimento ?? '',
              fieldType: TextInputType.datetime,
              enabled: store.pessoasStore.isEdit,
              isValid: store.pessoasStore.error.dataNascimento == null,
              validateAction: (value) {
                store.pessoasStore.validateDataNascimento();
              },
              inputFormatters: [
                TextInputMask(
                  mask: ['99/99/9999'],
                  reverse: false,
                )
              ],
            ),
          ),
          Observer(
            builder: (_) => FormDropDownField(
              initialValue: store.pessoasStore.sexo,
              name: 'Sexo',
              labelText: 'Sexo',
              hintText: 'Escolha o sexo',
              errorText: store.pessoasStore.error.sexo ?? "",
              enabled: store.pessoasStore.isEdit,
              isValid: store.pessoasStore.error.sexo == null,
              onChangeAction: (value) {
                store.pessoasStore.sexo = value;
                store.pessoasStore.validateSexo();
              },
              lista: Utils.sexo,
            ),
          ),
          Observer(
            builder: (_) => FormTextField(
              controller: store.pessoasStore.controllerTelefone,
              labelText: "Telefone",
              hintText: "Telefone",
              errorText: store.pessoasStore.error.telefone ?? '',
              fieldType: TextInputType.text,
              enabled: store.pessoasStore.isEdit,
              isValid: store.pessoasStore.error.telefone == null,
              validateAction: (value) {
                store.pessoasStore.validateTelefone();
              },
              inputFormatters: [
                TextInputMask(
                  mask: ['(99) 9999 9999', '(99) 99999 9999'],
                  reverse: false,
                )
              ],
            ),
          ),
          Observer(builder: (_) {
            return CheckboxListTile(
              title: const Text(
                "Responsável",
                style: TextStyle(
                  fontSize: 14,
                  color: Cores.dark,
                ),
              ),
              checkColor: Cores.corPrincipal,
              activeColor: Cores.corDeLinha,
              value: store.pessoasStore.responsavel,
              onChanged: (value) {
                store.pessoasStore.check();
              },
              controlAffinity: ListTileControlAffinity.trailing,
            );
          }),
          Observer(builder: (_) {
            if (store.pessoasStore.comprovante != null) {
              return ImageTileCollapseRemovable(
                  file: store.pessoasStore.comprovante!,
                  title: "Documento de identificação",
                  onClick: () {
                    store.pessoasStore.comprovante = null;
                  });
            } else {
              return const SizedBox();
            }
          }),
          ButtomField(
            labelText: 'Documento de identificação',
            background: Cores.secondary,
            icone: const FaIcon(
              FontAwesomeIcons.camera,
              size: 18,
            ),
            onClick: () async {
              final ImagePicker _picker = ImagePicker();

              final XFile? xfile =
                  await _picker.pickImage(source: ImageSource.camera);

              if (xfile != null) {
                store.pessoasStore.comprovante = xfile;
              }
            },
          ),
          Observer(builder: (_) {
            return ButtomField(
              icone: store.pessoasStore.isLoadingAddPessoa
                  ? const FaIcon(
                      FontAwesomeIcons.spinner,
                      size: 15,
                    )
                  : null,
              labelText:
                  store.pessoasStore.pessoa != null ? "Salvar" : "Adicionar",
              background: Cores.corPrincipal,
              textColor: Cores.white,
              onClick: () async {
                store.pessoasStore.validateAll();
                bool has = store.pessoasStore.error.hasErrors;
                if (has) {
                  SnackApp.error("O formulário contém erros");
                } else {
                  store.pessoasStore.isLoadingAddPessoa = true;
                  //  if (store.pessoasStore.familia != null) {
                  PessoaEntity? novaPessoa = PessoaEntity(
                    id: '',
                    nome: store.pessoasStore.controllerNome.text,
                    cpf: store.pessoasStore.controllerCpf.text.isEmpty
                        ? null
                        : store.pessoasStore.controllerCpf.text
                            .replaceAll('-', '')
                            .replaceAll('.', '')
                            .replaceAll(' ', ''),
                    dataNascimento: DateFormat('dd/MM/yyyy').parse(
                      store.pessoasStore.controllerDataNascimento.text,
                    ),
                    sexo: store.pessoasStore.sexo,
                    responsavel: store.pessoasStore.responsavel,
                    telefone: store.pessoasStore.controllerTelefone.text.isEmpty
                        ? null
                        : store.pessoasStore.controllerTelefone.text,
                  );

                  novaPessoa = await controller.pessoaController.createPessoa(
                    store.familia!.id,
                    novaPessoa,
                    store.pessoasStore.comprovante,
                  );
                  if (novaPessoa != null) {
                    store.pessoasStore.addPessoas(novaPessoa);
                    store.pessoasStore.cleanForm();
                  }
                }
                store.pessoasStore.isLoadingAddPessoa = false;
              },
            );
          }),
          Observer(builder: (_) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: store.pessoasStore.pessoasLength,
              itemBuilder: (context, index) {
                return PessoaListTile(
                  controller: controller,
                  pessoa: store.pessoasStore.pessoas[index],
                  store: store.pessoasStore,
                  index: index,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
