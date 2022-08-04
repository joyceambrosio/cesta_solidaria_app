import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/auth/presentation/stores/login_store.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  final controler = Modular.get<AuthController>();
  final store = LoginStore();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Image.asset("assets/imgs/logo.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(
                        builder: (_) => FormTextField(
                              controller: store.controllerEmail,
                              labelText: "Email",
                              hintText: "Digite o seu email",
                              errorText: store.error.email ?? '',
                              fieldType: TextInputType.text,
                              isValid: true,
                              validateAction: (value) {
                                store.validateEmail();
                              },
                            )),
                    Observer(
                        builder: (_) => FormTextField(
                              controller: store.controllerSenha,
                              labelText: "Senha",
                              hintText: "Digite sua senha",
                              errorText: store.error.password ?? '',
                              fieldType: TextInputType.text,
                              isValid: true,
                              obscure: true,
                              validateAction: (value) {
                                store.validatePassword();
                              },
                            )),
                    InkWell(
                      onTap: () {
                        Modular.to.pushReplacementNamed('/auth/forgot');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: const Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                            color: Cores.corPrincipal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    ButtomField(
                      labelText: "Entrar",
                      background: Cores.corPrincipal,
                      textColor: Cores.white,
                      icone: store.isLoading
                          ? const FaIcon(
                              FontAwesomeIcons.spinner,
                              size: 15,
                            )
                          : null,
                      onClick: () {
                        store.isLoading = true;
                        store.validateTodos();
                        if (store.error.hasErrors) {
                          SnackApp.error("O formulário contém erros");
                        } else {
                          controler.login(
                            store.controllerEmail.text,
                            store.controllerSenha.text,
                          );
                        }
                        store.isLoading = false;
                      },
                    ),
                    ButtomField(
                      labelText: "Cadastre-se",
                      background: Cores.info,
                      onClick: () {
                        Modular.to.pushReplacementNamed('/auth/signin');
                      },
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
