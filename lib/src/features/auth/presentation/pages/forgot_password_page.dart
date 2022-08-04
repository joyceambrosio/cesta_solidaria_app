import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/auth/presentation/stores/forgot_password_store.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final controler = Modular.get<AuthController>();
  final store = ForgotPasswordStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Esqueci a senha'),
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
                    FormTextField(
                      controller: store.controllerEmail,
                      labelText: "Email",
                      hintText: "Digite o email cadastrado",
                      errorText: store.error.email ?? "",
                      fieldType: TextInputType.text,
                      isValid: true,
                      validateAction: (value) {
                        store.validateEmail();
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Modular.to.pushReplacementNamed('/auth/reset');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: const Text(
                          "Já tem um código? Insira aqui.",
                          style: TextStyle(
                            color: Cores.corPrincipal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    ButtomField(
                      onClick: () {
                        store.isLoading = true;
                        store.validateEmail();
                        if (store.error.hasErrors) {
                          SnackApp.error("O formulário contém erros");
                        } else {
                          controler.forgotPassword(
                            store.controllerEmail.text,
                          );
                        }
                        store.isLoading = false;
                      },
                      icone: store.isLoading
                          ? const FaIcon(
                              FontAwesomeIcons.spinner,
                              size: 15,
                            )
                          : null,
                      labelText: "Recuperar senha",
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
