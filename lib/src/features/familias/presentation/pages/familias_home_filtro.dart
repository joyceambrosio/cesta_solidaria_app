import 'package:cartallum_app/src/core/shared/breakpoints.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';

import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familias_home_store.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FamiliasHomeFiltro extends StatelessWidget {
  final FamiliasHomeStore store;

  const FamiliasHomeFiltro({
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
      ),
      body: Container(
        padding: paddingInAll,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text(
                  "Renda",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              FormBuilderRangeSlider(
                name: 'range_slider',
                // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                min: 0.0,
                max: 5000.0,
                initialValue: const RangeValues(0, 5000),
                divisions: 50,
                activeColor: Cores.corPrincipal,
                decoration: const InputDecoration(labelText: 'Renda familiar'),
                onChanged: (value) {
                  store.filtroStore.rendaInicial = value?.start ?? 0;
                  store.filtroStore.rendaFinal = value?.end ?? 0;
                },
              ),

              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text(
                  "Familiares",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              FormBuilderRangeSlider(
                name: 'range_slider',
                // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                min: 0.0,
                max: 115.0,
                initialValue: const RangeValues(0, 115),
                divisions: 115,
                activeColor: Cores.corPrincipal,
                decoration: const InputDecoration(labelText: 'Faixa de idade'),
                onChanged: (value) {
                  store.filtroStore.idadeInicial = value?.start ?? 0;
                  store.filtroStore.idadeFinal = value?.end ?? 0;
                },
              ),
              FormBuilderSlider(
                name: 'range_slider',
                // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                min: 0.0,
                max: 24.0,
                initialValue: 24,
                divisions: 24,
                activeColor: Cores.corPrincipal,
                decoration: const InputDecoration(
                    labelText: 'Número máximo de integrantes'),
                onChanged: (value) {
                  store.filtroStore.numeroFamiliares = value ?? 24;
                },
              ),
              FormBuilderSlider(
                name: 'range_slider',
                // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                min: 0.0,
                max: 24.0,
                initialValue: 24,
                divisions: 24,
                activeColor: Cores.corPrincipal,
                decoration: const InputDecoration(
                    labelText: 'Número máximo de crianças'),
                onChanged: (value) {
                  store.filtroStore.numeroCriancas = value ?? 24;
                },
              ),
              //numero de cestas doadas por período

              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text(
                  "Cestas",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              FormBuilderCheckbox(
                initialValue: true,
                name: 'comprovante',
                title: const Text('Cestas com irregularidade'),
                activeColor: Cores.corPrincipal,
                onChanged: (value) {
                  store.filtroStore.cestasComDisparidade = value;
                },
              ),
              FormBuilderRangeSlider(
                name: 'range_slider',
                // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                min: 0.0,
                max: 24,
                initialValue: const RangeValues(0, 24),
                divisions: 24,
                activeColor: Cores.corPrincipal,
                decoration: const InputDecoration(
                    labelText: 'Cestas recebidas nos ultimos 12 meses'),
                onChanged: (value) {
                  store.filtroStore.cestasUltimosDozeMesesInicial =
                      value?.start ?? 0;
                  store.filtroStore.cestasUltimosDozeMesesFinal =
                      value?.end ?? 0;
                },
              ),
              FormBuilderSlider(
                name: 'range_slider',
                // validator: FormBuilderValidators.compose([FormBuilderValidators.min(context, 6)]),
                min: 0.0,
                max: 24.0,
                initialValue: 0,
                divisions: 24,
                activeColor: Cores.corPrincipal,
                decoration: const InputDecoration(
                    labelText: 'Número máximo de meses sem receber cestas'),
                onChanged: (value) {
                  store.filtroStore.mesesSemReceberCestas = value;
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Text(
                  "Endereco",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Observer(builder: (_) {
                return FormTextField(
                  controller: store.filtroStore.controllerBairro,
                  labelText: 'Bairro',
                  hintText: 'hintText',
                  errorText: '',
                  isValid: true,
                  validateAction: (value) {},
                  fieldType: TextInputType.text,
                );
              }),
              Observer(builder: (_) {
                return FormTextField(
                  controller: store.filtroStore.controllerCep,
                  labelText: 'Cep',
                  hintText: 'Cep',
                  errorText: store.filtroStore.cepError ?? '',
                  isValid: store.filtroStore.cepError == null,
                  validateAction: (value) {
                    store.filtroStore.validateCep();
                  },
                  fieldType: TextInputType.number,
                  inputFormatters: [
                    TextInputMask(
                      mask: ['99999-999'],
                      reverse: false,
                    )
                  ],
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        onPressed: () {
          Modular.to.pop(store.filtroStore.buildFilter());
        },
        backgroundColor: Colors.green,
        child: const FaIcon(FontAwesomeIcons.check),
      ),
    );
  }
}
