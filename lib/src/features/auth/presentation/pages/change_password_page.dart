import 'package:cartallum_app/src/features/auth/presentation/stores/user_update_store.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:cartallum_app/src/core/errors/snack_app.dart';
import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final controler = Modular.get<AuthController>();
  final store = UpdateUserStore();
  @override
  void initState() {
    controler.getMe();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });

    super.initState();
  }

  _asyncMethod() async {
    store.setUser(await controler.getMe());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mudança de senha"),
      ),
      backgroundColor: Cores.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: Utils.marginPadrao,
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
                            controller: store.controllerOldPassword,
                            labelText: "Senha antiga",
                            hintText: "Digite a senha antiga",
                            errorText: store.error.oldPassword ?? '',
                            fieldType: TextInputType.text,
                            isValid: store.error.oldPassword == null,
                            obscure: true,
                            validateAction: (value) {
                              store.validatePassword();
                            },
                          ),
                        ),
                        Observer(
                          builder: (_) => FormTextField(
                            controller: store.controllerPassword,
                            labelText: "Nova senha",
                            hintText: "Digite sua senha",
                            errorText: store.error.password ?? '',
                            fieldType: TextInputType.text,
                            isValid: store.error.password == null,
                            obscure: true,
                            validateAction: (value) {
                              store.validatePassword();
                            },
                          ),
                        ),
                        Observer(
                          builder: (_) => FormTextField(
                            controller: store.controllerPasswordConfirm,
                            labelText: "Confirmação da nova senha",
                            hintText: "Digite a confirmação da sua senha",
                            errorText: store.error.passwordConfirm ?? '',
                            fieldType: TextInputType.text,
                            isValid: store.error.passwordConfirm == null,
                            obscure: true,
                            validateAction: (value) {
                              store.validatePasswordConfirm();
                            },
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
                            store.isLoading = true;
                            store.validateOldPassword();
                            store.validatePassword();
                            store.validatePasswordConfirm();

                            if (store.error.hasErrors) {
                              SnackApp.error("O formulário contém erros");
                            } else {
                              controler.updatePassword(
                                store.controllerOldPassword.text,
                                store.controllerPassword.text,
                                store.controllerPasswordConfirm.text,
                              );
                              store.isLoading = true;
                              Modular.to.pop();
                            }
                            store.isLoading = false;
                          },
                          labelText: "Salvar",
                          background: Cores.corPrincipal,
                          textColor: Cores.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
