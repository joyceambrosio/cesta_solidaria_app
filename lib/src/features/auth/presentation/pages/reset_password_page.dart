import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/auth/presentation/stores/reset_password_store.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);
  final controler = Modular.get<AuthController>();
  final store = ResetPasswordStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Redefinir senha'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Modular.to.pushReplacementNamed('/auth/forgot'),
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
                      controller: store.controllerCodigo,
                      labelText: "Código",
                      hintText: "Código de 6 dígitos enviado pelo email",
                      errorText: store.error.codigo ?? "",
                      fieldType: TextInputType.text,
                      isValid: true,
                      validateAction: (value) {
                        return true;
                      },
                    ),
                    FormTextField(
                      controller: store.controllerPassword,
                      labelText: "Senha",
                      hintText: "Digite sua nova senha",
                      errorText: store.error.password ?? "",
                      fieldType: TextInputType.text,
                      isValid: true,
                      obscure: true,
                      validateAction: (value) {
                        return true;
                      },
                    ),
                    FormTextField(
                      controller: store.controllerPasswordConfirm,
                      labelText: "Confirmação de Senha",
                      hintText: "Digite a confirmação da sua senha",
                      errorText: store.error.passwordConfirm ?? "",
                      fieldType: TextInputType.text,
                      isValid: true,
                      obscure: true,
                      validateAction: (value) {
                        return true;
                      },
                    ),
                    ButtomField(
                      labelText: "Redefinir",
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
                        store.validateAll();
                        if (store.error.hasErrors) {
                          SnackApp.error("O formulário contém erros");
                        } else {
                          controler.resetPassword(
                            store.controllerCodigo.text,
                            store.controllerPassword.text,
                            store.controllerPasswordConfirm.text,
                          );
                        }
                        store.isLoading = false;
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
