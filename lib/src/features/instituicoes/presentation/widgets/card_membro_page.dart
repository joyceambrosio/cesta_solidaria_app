import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/features/membros/domain/entities/membro_entity.dart';
import 'package:cartallum_app/src/features/users/domain/entities/user_auth_entity.dart';
import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardMembroPage extends StatelessWidget {
  final MembroEntity membro;
  final controller = Modular.get<AuthController>();
  CardMembroPage({
    required this.membro,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPublicUser(),
      builder: (
        BuildContext context,
        AsyncSnapshot<UserAuthEntity> snapshot,
      ) {
        List<Widget> children;
        if (snapshot.hasData) {
          UserAuthEntity userMembro = snapshot.data!;

          children = <Widget>[
            _cardMembro(
              membro,
              userMembro,
            )
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Aguarde...'),
            )
          ];
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        );
      },
    );
  }

  Future<UserAuthEntity> getPublicUser() async {
    UserAuthEntity? familiaEntity = await controller.getUser(membro.usuario);
    return familiaEntity!;
  }

  Widget _cardMembro(MembroEntity membro, UserAuthEntity userMembro) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          Shadows.muitoLeve(),
        ],
        borderRadius: Utils.arredondamentoPadrao,
        color: Cores.white,
      ),
      width: double.infinity,
      margin: Utils.marginPadrao,
      padding: Utils.paddingPadrao,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Cores.white,
                  foregroundImage: NetworkImage(userMembro.photo),
                  backgroundImage: const AssetImage("assets/imgs/default.jpg"),
                ),
              ),
              Tooltip(
                message: "Papel do membro",
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Chip(
                    backgroundColor:
                        userMembro.role == 'admin' ? Cores.info : Cores.warning,
                    avatar: Icon(
                      userMembro.role == 'admin'
                          ? Icons.admin_panel_settings_outlined
                          : Icons.emoji_people_sharp,
                      color: Cores.textColor,
                      size: 15,
                    ),
                    label: Text(
                      userMembro.role == 'admin' ? 'Administrador' : 'Usuário',
                      style: const TextStyle(
                        color: Cores.textColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          DescriptionList(
            informacoes: <String, String>{
              "Nome": userMembro.name,
              "Status": membro.active ? "Ativo" : "Inativo"
            },
          )
        ],
      ),
    );
  }
}
