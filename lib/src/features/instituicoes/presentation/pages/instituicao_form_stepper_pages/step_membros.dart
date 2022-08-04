import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/breakpoints.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_dropdown_field.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/instituicao_form_stepper_store.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/widgets/membro_card_step.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';

class StepMembrosInstituicao extends StatelessWidget {
  final InstituicaoController controller;
  final InstituicaoFormStepperStore store;

  const StepMembrosInstituicao({
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
          Observer(builder: (_) {
            return Container(
              height: 70,
              margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: FormBuilderTypeAhead<UserAuthEntity>(
                enabled: store.membrosStore.isEdit,
                selectionToTextTransformer: (listaUsers) => listaUsers.name,
                controller: store.membrosStore.controllerUid,
                onChanged: (value) {
                  if (value != null) {
                    store.membrosStore.escolha = value;
                    store.membrosStore.controllerUid.text = value.name;
                    store.membrosStore.validateUid();
                  }
                },
                onSuggestionSelected: (value) {
                  store.membrosStore.escolha = value;
                  store.membrosStore.controllerUid.text = value.name;
                  store.membrosStore.validateUid();
                },
                name: 'usuarios',
                itemBuilder: (context, item) {
                  return ListTile(title: Text(item.name));
                },
                suggestionsCallback: (query) {
                  if (query.isNotEmpty) {
                    var lowercaseQuery = query.toLowerCase();
                    return store.membrosStore.usersFiltro.where((item) {
                      return item.name.toLowerCase().contains(lowercaseQuery) ||
                          item.email.toLowerCase().contains(lowercaseQuery);
                    }).toList(growable: false)
                      ..sort((a, b) => a.name
                          .toLowerCase()
                          .indexOf(lowercaseQuery)
                          .compareTo(
                              b.name.toLowerCase().indexOf(lowercaseQuery)));
                  } else {
                    return store.membrosStore.usersFiltro;
                  }
                },
                decoration: InputDecoration(
                  suffix: IconButton(
                    onPressed: () {
                      store.membrosStore.controllerUid.text = '';
                      store.membrosStore.escolha = null;
                      store.membrosStore.validateUid();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.xmark,
                      size: 15,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 15, right: 15),
                  focusColor: Cores.primary,
                  labelText: 'Nome ou email de usuário',
                  hintText: 'Digite o nome de usuário',
                  errorText: store.membrosStore.error.nome ?? '',
                  labelStyle: const TextStyle(
                    color: Cores.dark,
                  ),
                  fillColor: Cores.inputBackgroundColor,
                  filled: true,
                  suffixIcon: store.membrosStore.error.nome == null
                      ? null
                      : const Icon(
                          Icons.error_outline,
                          color: Cores.danger,
                        ),
                  border: store.membrosStore.error.nome == null
                      ? const OutlineInputBorder(
                          borderRadius: borderRadiosAll,
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                        )
                      : const OutlineInputBorder(
                          borderRadius: borderRadiosAll,
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.solid),
                        ),
                ),
              ),
            );
          }),
          Observer(builder: (_) {
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  store.membrosStore.error.uid ?? '',
                  style: const TextStyle(color: Cores.danger, fontSize: 12),
                ));
          }),
          Observer(builder: (_) {
            if (store.membrosStore.usersFiltro.isEmpty) {
              return const SizedBox();
            }
            return FormDropDownField(
              initialValue: store.membrosStore.role,
              name: 'estado',
              labelText: 'Papel',
              hintText: 'Escolha um papel',
              errorText: store.membrosStore.error.role ?? '',
              enabled: store.membrosStore.isEdit,
              isValid: store.membrosStore.error.role == null,
              onChangeAction: (value) {
                store.membrosStore.role = value;
                store.membrosStore.validateRole();
              },
              lista: Utils.roleMembro,
            );
          }),
          ButtomField(
            onClick: () async {
              store.membrosStore.validateUid();
              store.membrosStore.validateRole();

              if (store.membrosStore.error.hasErrors) {
                SnackApp.error("O formulário contém erros");
              } else {
                if (store.instituicao != null) {
                  store.isLoadingAddMembro = true;
                  MembroEntity? membro = MembroEntity(
                    id: '',
                    role: store.membrosStore.role,
                    active: true,
                    instituicao: store.membrosStore.instituicao!.id,
                    usuario: store.membrosStore.escolha!.id,
                    criadoEm: DateTime.now(),
                  );
                  membro = await controller.membroController
                      .addMembro(store.instituicao!.id, membro);

                  if (membro != null) {
                    store.setInstituicao(
                        await controller.getInstituicao(store.instituicao!.id));
                    store.membrosStore.setUsersFiltro();
                    store.membrosStore.setMembrosVisual();
                  }
                  store.isLoadingAddMembro = false;
                }
              }
            },
            labelText: "Adicionar",
            background: Cores.corPrincipal,
            textColor: Cores.white,
            icone: store.isLoadingAddMembro
                ? const FaIcon(
                    FontAwesomeIcons.spinner,
                    size: 15,
                  )
                : null,
          ),
          Observer(
            builder: (_) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: store.membrosStore.membrosVisualLength,
                itemBuilder: (context, index) {
                  return CardMembro(
                    membro: store.membrosStore.membrosVisual[index],
                    index: index,
                    store: store,
                    controller: controller,
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
