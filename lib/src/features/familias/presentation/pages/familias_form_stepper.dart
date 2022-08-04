import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_form_stepper_pages/step_endereco.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_form_stepper_pages/step_familia.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_form_stepper_pages/step_informativo.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_form_stepper_pages/step_pessoas.dart';

import 'package:cartallum_app/src/features/familias/presentation/stores/familia_form_stepper_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FamiliasFormStepper extends StatefulWidget {
  final String? familiaId;
  const FamiliasFormStepper({
    this.familiaId,
    Key? key,
  }) : super(key: key);

  @override
  State<FamiliasFormStepper> createState() => _FamiliasFormStepperState();
}

class _FamiliasFormStepperState extends State<FamiliasFormStepper> {
  final FamiliaController controller = Modular.get<FamiliaController>();
  final FamiliaFormStepperStore store = FamiliaFormStepperStore();

  int _stepAtual = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleFamilia();
    });
    super.initState();
  }

  handleFamilia() async {
    if (widget.familiaId != null) {
      FamiliaEntity? instituicao = await controller.getFamilia(
        widget.familiaId!,
      );
      store.setFamilia(instituicao!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        title: const Text('Familia'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps,
        currentStep: _stepAtual,
        onStepCancel: onStepCancel,
        onStepContinue: onStepContinue,
        onStepTapped: (int index) {
          if (store.familiaStore.isEdit) {
            setState(() {
              _stepAtual = index;
            });
          }
        },
        controlsBuilder: (
          BuildContext context,
          ControlsDetails details,
        ) {
          return Row(
            children: <Widget>[
              Flexible(
                child: ButtomField(
                  onClick: _stepAtual == 0 ? () {} : details.onStepCancel,
                  labelText: "Anterior",
                  background: _stepAtual == 0 ? Cores.secondary : Cores.dark,
                  textColor: _stepAtual == 0 ? Cores.corTitulo : Cores.white,
                ),
              ),
              Flexible(
                child: ButtomField(
                  onClick: details.onStepContinue,
                  labelText: "Próximo",
                  background: Cores.info,
                  textColor: Cores.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Step> get getSteps {
    return <Step>[
      Step(
        isActive: _stepAtual >= 0,
        state: _stepAtual >= 1 ? StepState.complete : StepState.indexed,
        title: _stepAtual == 0 ? const Text('Família') : const Text(''),
        content: StepFamilia(
          controller: controller,
          store: store.familiaStore,
        ),
      ),
      Step(
        isActive: _stepAtual >= 1,
        state: _stepAtual >= 2 ? StepState.complete : StepState.indexed,
        title: _stepAtual == 1 ? const Text('Endereço') : const Text(''),
        content: StepEndereco(
          controller: controller,
          store: store.enderecoStore,
        ),
      ),
      Step(
        isActive: _stepAtual >= 2,
        state: _stepAtual >= 3 ? StepState.complete : StepState.indexed,
        title: _stepAtual == 2 ? const Text('Informativo') : const Text(''),
        content: const StepInformativo(),
      ),
      Step(
        isActive: _stepAtual >= 3,
        state: _stepAtual >= 4 ? StepState.complete : StepState.indexed,
        title: _stepAtual == 3 ? const Text('Integrantes') : const Text(''),
        content: StepPessoas(
          controller: controller,
          store: store,
        ),
      ),
    ];
  }

  void onStepContinue() async {
    final isLastStep = _stepAtual == getSteps.length - 1;

    bool isValid = false;

    switch (_stepAtual) {
      case 0:
        store.familiaStore.validateTodos();
        if (store.familiaStore.error.hasErrors) {
          SnackApp.error("O formulário contém erros");
        } else {
          FamiliaEntity? familiaCtrl = store.familia;
          if (familiaCtrl != null) {
            familiaCtrl.renda = double.tryParse(store
                    .familiaStore.controllerRenda.text
                    .replaceAll('R', '')
                    .replaceAll('\$', '')
                    .replaceAll('.', '-')
                    .replaceAll(',', '.')
                    .replaceAll('-', '')
                    .replaceAll(' ', '')) ??
                0;

            familiaCtrl.endereco = null;
            familiaCtrl = await controller.updateFamilia(
              familiaCtrl,
              store.familiaStore.comprovante,
              null,
            );
          } else {
            familiaCtrl = FamiliaEntity(
              id: '',
              renda: double.tryParse(store.familiaStore.controllerRenda.text
                      .replaceAll('R', '')
                      .replaceAll('\$', '')
                      .replaceAll('.', '-')
                      .replaceAll(',', '.')
                      .replaceAll('-', '')
                      .replaceAll(' ', '')) ??
                  0,
              status: false,
              motivoStatus: 'novocadastro',
              statusEm: DateTime.now(),
              criadoEm: DateTime.now(),
            );

            familiaCtrl = await controller.createFamilia(
              familiaCtrl,
              store.familiaStore.comprovante,
              null,
            );
          }
          if (familiaCtrl == null) {
            isValid = false;
          } else {
            store.setFamilia(familiaCtrl);
            isValid = true;
          }
        }
        break;
      case 1:
        store.enderecoStore.validateTodos();
        if (store.enderecoStore.error.hasErrors) {
          SnackApp.error("O formulário contém erros");
        } else {
          if (store.familia == null) {
            isValid = false;
            break;
          }

          FamiliaEntity? familiaCtrl = store.familia!;

          familiaCtrl.endereco = EnderecoEntity(
            pais: store.enderecoStore.pais,
            estado: store.enderecoStore.estado,
            cep: store.enderecoStore.controllerCep.text,
            cidade: store.enderecoStore.controllerCidade.text,
            logradouro: store.enderecoStore.controllerLogradouro.text,
            numero: store.enderecoStore.controllerNumero.text,
            bairro: store.enderecoStore.controllerBairro.text,
            complemento: store.enderecoStore.controllerComplemento.text,
            pontoReferencia: store.enderecoStore.controllerPontoReferencia.text,
            criadoEm: DateTime.now(),
          );

          familiaCtrl = await controller.updateFamilia(
            familiaCtrl,
            null,
            store.enderecoStore.comprovante,
          );

          if (familiaCtrl != null) {
            store.setFamilia(familiaCtrl);
            isValid = true;
          } else {
            isValid = false;
          }
        }
        break;
      case 2:
        isValid = true;
        break;

      default:
        break;
    }

    if (isLastStep) {
      if (store.familia?.id != null) {
        if (store.pessoasStore.pessoasLength != 0) {
          Modular.to
              .pushReplacementNamed('/familias/familia/${store.familia!.id}');
        } else {
          SnackApp.info("Adicione pelo menos uma pessoa à família");
        }
      }
    }
    if (!isLastStep && isValid) {
      setState(() {
        _stepAtual += 1;
      });
    }
  }

  void onStepCancel() {
    if (_stepAtual > 0) {
      setState(() {
        _stepAtual -= 1;
      });
    }
  }
}
