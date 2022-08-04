import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/auth/presentation/stores/signin_store.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final AuthController controler = Modular.get<AuthController>();
  final store = SigninStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Criar conta'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Modular.to.pushReplacementNamed('/auth/'),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: Utils.paddingPadrao,
          decoration: const BoxDecoration(
            color: Cores.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                width: double.infinity,
                margin: Utils.marginPadrao,
                padding: Utils.paddingPadrao,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) => FormTextField(
                        controller: store.controllerNome,
                        labelText: "Nome Completo",
                        hintText: "Seu nome completo",
                        errorText: store.error.nome ?? '',
                        fieldType: TextInputType.text,
                        isValid: true,
                        validateAction: (value) {
                          store.validateNome();
                        },
                      ),
                    ),
                    Observer(
                      builder: (_) => FormTextField(
                        controller: store.controllerEmail,
                        labelText: "Email",
                        hintText: "exemplo@gmail.com",
                        errorText: store.error.email ?? '',
                        fieldType: TextInputType.text,
                        isValid: true,
                        validateAction: (value) {
                          store.validateEmail();
                        },
                      ),
                    ),
                    Observer(
                      builder: (_) => FormTextField(
                        controller: store.controllerPassword,
                        labelText: "Senha",
                        hintText: "Digite sua senha",
                        errorText: store.error.password ?? '',
                        fieldType: TextInputType.text,
                        isValid: true,
                        obscure: true,
                        validateAction: (value) {
                          store.validatePassword();
                        },
                      ),
                    ),
                    Observer(
                      builder: (_) => FormTextField(
                        controller: store.controllerPasswordConfirm,
                        labelText: "Confirmação de senha",
                        hintText: "Digite a confirmação da sua senha",
                        errorText: store.error.passwordConfirm ?? '',
                        fieldType: TextInputType.text,
                        isValid: true,
                        obscure: true,
                        validateAction: (value) {
                          store.validatePasswordConfirm();
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Modular.to.pushReplacementNamed('/auth/');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: const Text(
                          "Já tem conta? Faça o login",
                          style: TextStyle(
                            color: Cores.corPrincipal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    ButtomField(
                      icone: store.isLoading
                          ? const FaIcon(
                              FontAwesomeIcons.spinner,
                              size: 15,
                            )
                          : null,
                      onClick: () {
                        store.validateTodos();
                        store.isLoading = true;
                        if (store.error.hasErrors) {
                          SnackApp.error("O formulário contém erros");
                        } else {
                          controler.signup(
                            store.controllerNome.text,
                            store.controllerEmail.text,
                            store.controllerPassword.text,
                            store.controllerPasswordConfirm.text,
                          );
                        }
                        store.isLoading = false;
                      },
                      labelText: "Cadastrar",
                      background: Cores.corPrincipal,
                      textColor: Cores.white,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
