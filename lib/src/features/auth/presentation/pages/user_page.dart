import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_icon_field.dart';
import 'package:cartallum_app/src/features/auth/presentation/stores/user_update_store.dart';
import 'package:cartallum_app/src/features/auth/presentation/widgets/image_profile.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
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

class UserAuthPage extends StatefulWidget {
  const UserAuthPage({Key? key}) : super(key: key);

  @override
  State<UserAuthPage> createState() => _UserAuthPageState();
}

class _UserAuthPageState extends State<UserAuthPage> {
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
    return SizedBox(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        alignment: Alignment.bottomLeft,
                        onPressed: () {
                          setState(() {
                            store.isEditing = !store.isEditing;
                          });
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.pen,
                          color: Cores.textColor,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Center(
                        child: Observer(builder: (_) {
                          return ImageProfile(
                            imageUrl: store.photo,
                          );
                        }),
                      ),
                      Container(
                        padding: Utils.paddingPadrao,
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.only(right: 30, left: 30),
                        child: InkWell(
                          onTap: () async {
                            UserAuthEntity? user =
                                await controler.updateMyPhoto();
                            if (user != null) {
                              store.setUser(await controler.getMe());
                              SnackApp.sucess("Foto atualizada com sucesso");
                            }
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.camera,
                            color: Cores.textColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // FormTextIconField(
                      //   readOnly: true,
                      //   icon: FontAwesomeIcons.copy,
                      //   iconAction: () {
                      //     Clipboard.setData(
                      //         ClipboardData(text: store.controllerUid.text));
                      //     SnackApp.info(
                      //         'Identificação copiada para a área de transferência');
                      //   },
                      //   controller: store.controllerUid,
                      //   labelText: "Identificação",
                      //   errorText: '',
                      //   hintText: '',
                      //   fieldType: TextInputType.text,
                      //   enabled: true,
                      //   isValid: true,
                      //   validateAction: (value) {
                      //     return true;
                      //   },
                      // ),
                      FormTextIconField(
                        readOnly: true,
                        icon: store.controllerRole.text == 'Administrador'
                            ? FontAwesomeIcons.userShield
                            : FontAwesomeIcons.user,
                        iconAction: () {},
                        controller: store.controllerRole,
                        labelText: "Nível de segurança",
                        errorText: '',
                        hintText: '',
                        fieldType: TextInputType.text,
                        enabled: true,
                        isValid: true,
                        validateAction: (value) {
                          return true;
                        },
                      ),
                      Observer(
                        builder: (_) => FormTextField(
                          controller: store.controllerNome,
                          labelText: "Nome Completo",
                          hintText: "Seu nome completo",
                          errorText: store.error.nome ?? '',
                          fieldType: TextInputType.text,
                          enabled: store.isEditing,
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
                          enabled: store.isEditing,
                          isValid: true,
                          validateAction: (value) {
                            store.validateEmail();
                          },
                        ),
                      ),
                      if (store.isEditing)
                        ButtomField(
                          onClick: () {
                            store.validateNome();
                            store.validateEmail();
                            if (store.error.hasErrorsUser) {
                              SnackApp.error("O formulário contém erros");
                            } else {
                              controler.updateMe(
                                store.controllerNome.text,
                                store.controllerEmail.text,
                              );
                            }
                          },
                          labelText: "Salvar",
                          background: Cores.corPrincipal,
                          textColor: Cores.white,
                        ),
                      if (!store.isEditing)
                        ButtomField(
                          labelText: 'Mudar a senha',
                          icone: const FaIcon(
                            FontAwesomeIcons.key,
                            color: Cores.textColor,
                            size: 15,
                          ),
                          textColor: Cores.textColor,
                          background: Cores.corSecundaria,
                          onClick: () {
                            Modular.to.pushNamed('/auth/changePassword');
                          },
                        ),
                      ButtomField(
                        labelText: 'Logout',
                        icone: const FaIcon(
                          FontAwesomeIcons.arrowRightToBracket,
                          size: 15,
                        ),
                        background: Cores.corPrincipal,
                        onClick: () {
                          Modular.to.navigate('/auth/logout');
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
