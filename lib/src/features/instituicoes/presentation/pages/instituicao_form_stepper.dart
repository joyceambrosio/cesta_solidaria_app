import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/features/endereco_instituicao/domain/entities/endereco_instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/instituicao_controller.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_form_stepper_pages/step_endereco_instituicao.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_form_stepper_pages/step_instituicao.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/pages/instituicao_form_stepper_pages/step_membros.dart';
import 'package:cartallum_app/src/features/instituicoes/presentation/stores/instituicao_form_stepper_stores/instituicao_form_stepper_store.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstituicaoFormStepper extends StatefulWidget {
  final String? instituicaoId;
  const InstituicaoFormStepper({
    this.instituicaoId,
    Key? key,
  }) : super(key: key);

  @override
  State<InstituicaoFormStepper> createState() => _InstituicaoFormStepperState();
}

class _InstituicaoFormStepperState extends State<InstituicaoFormStepper> {
  final controller = Modular.get<InstituicaoController>();
  final authController = Modular.get<AuthController>();

  final store = InstituicaoFormStepperStore();

  int _stepAtual = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      handleInstituicao();
    });
    super.initState();
  }

  handleInstituicao() async {
    if (widget.instituicaoId != null) {
      InstituicaoEntity? instituicao = await controller.getInstituicao(
        widget.instituicaoId!,
      );
      store.setInstituicao(instituicao!);
    }
    List<UserAuthEntity> listaUsers = await authController.getUsers();

    store.setPublicUsers(listaUsers);
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey _menuKey = GlobalKey();
    return Scaffold(
      backgroundColor: Cores.background,
      appBar: AppBar(
        title: const Text('Instituições'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps,
        currentStep: _stepAtual,
        onStepCancel: onStepCancel,
        onStepContinue: onStepContinue,
        onStepTapped: (int index) {},
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
                  icone: store.isLoading
                      ? const FaIcon(
                          FontAwesomeIcons.spinner,
                          size: 15,
                        )
                      : null,
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
        title: const Text('Instituição'),
        content: StepInstituicao(
          controller: controller,
          store: store.instituicaoStore,
        ),
      ),
      Step(
        isActive: _stepAtual >= 1,
        state: _stepAtual >= 2 ? StepState.complete : StepState.indexed,
        title: const Text('Endereço'),
        content: StepEnderecoInstituicao(
          controller: controller,
          store: store.enderecoStore,
        ),
      ),
      Step(
        isActive: _stepAtual >= 2,
        state: _stepAtual >= 3 ? StepState.complete : StepState.indexed,
        title: const Text('Membros'),
        content: StepMembrosInstituicao(
          controller: controller,
          store: store,
        ),
      ),
    ];
  }

  void onStepContinue() async {
    final isLastStep = _stepAtual == getSteps.length - 1;

    switch (_stepAtual) {
      case 0:
        store.instituicaoStore.validateTodos();

        if (store.instituicaoStore.error.hasErrors) {
          SnackApp.error("O formulário contém erros");
        } else {
          InstituicaoEntity? instControl = store.instituicao;
          store.isLoading = true;

          if (instControl != null) {
            instControl.nome = store.instituicaoStore.controllerNome.text;
            instControl.sigla = store.instituicaoStore.controllerSigla.text;
            instControl.telefone =
                store.instituicaoStore.controllerTelefone.text;

            instControl = await controller.updateInstituicao(instControl);
            if (instControl?.id != null && instControl?.id != '') {
              instControl = await controller.getInstituicao(instControl!.id);
            }
          } else {
            instControl = InstituicaoEntity(
              id: '',
              nome: store.instituicaoStore.controllerNome.text,
              sigla: store.instituicaoStore.controllerSigla.text,
              tipo: 'instituicao',
              telefone: store.instituicaoStore.controllerTelefone.text,
              verificado: false,
            );

            instControl = await controller.createInstituicao(instControl);
          }

          if (instControl == null) {
            store.isValid = false;
          } else {
            store.setInstituicao(instControl);
            store.isValid = true;
          }
          store.isLoading = false;
        }
        break;
      case 1:
        store.enderecoStore.validateTodos();

        if (store.enderecoStore.error.hasErrors) {
          SnackApp.error("O formulário contém erros");
        } else {
          store.isLoading = true;
          EnderecoInstituicaoEntity? endControl;

          if (store.instituicao != null) {
            if (store.instituicao!.enderecos == null) {
              store.instituicao!.enderecos = [];
            }
          }

          if (store.instituicao!.enderecos!.isNotEmpty) {
            endControl = store.instituicao?.enderecos?.first;
          }

          endControl = EnderecoInstituicaoEntity(
            id: '',
            tipoEndereco: store.enderecoStore.tipo,
            pais: store.enderecoStore.pais,
            estado: store.enderecoStore.estado,
            cep: store.enderecoStore.controllerCep.text,
            cidade: store.enderecoStore.controllerCidade.text,
            logradouro: store.enderecoStore.controllerLogradouro.text,
            numero: store.enderecoStore.controllerNumero.text,
            bairro: store.enderecoStore.controllerBairro.text,
            complemento: store.enderecoStore.controllerComplemento.text,
            pontoReferencia: store.enderecoStore.controllerPontoReferencia.text,
          );

          endControl =
              await controller.controllerEndereco.createEnderecoInstituicao(
            store.instituicao!.id,
            endControl,
          );

          if (endControl != null) {
            store.instituicao!.enderecos = [];
            store.instituicao!.enderecos!.add(endControl);
            store.setInstituicao(store.instituicao);

            store.isValid = true;
          } else {
            store.isValid = false;
          }
          store.isLoading = false;
        }
        break;
      default:
        break;
    }

    if (isLastStep) {
      if (isLastStep) {
        if (store.instituicao?.id != null) {
          Modular.to.pushReplacementNamed(
              '/instituicoes/instituicao/${store.instituicao!.id}');
        }
      }
    }
    if (!isLastStep && store.isValid) {
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
