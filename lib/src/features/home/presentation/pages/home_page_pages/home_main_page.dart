import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/storage/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeMainPage extends StatelessWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Modular.get<AuthStore>();
    return Scaffold(
      backgroundColor: Cores.background,
      body: Container(
        padding: Utils.paddingPadrao,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              // const Padding(
              //   padding: EdgeInsets.all(10),
              //   child: Text(
              //     "Bem Vindo",
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 24,
              //         color: Cores.corTitulo),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              authStore.hasAcessoFamilias()
                  ? InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: Utils.arredondamentoPadrao,
                          boxShadow: [
                            Shadows.leve(),
                          ],
                        ),
                        height: 150,
                        margin: Utils.marginPadrao,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/imgs/familia.png",
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: Utils.paddingPadrao,
                                child: const Text(
                                  "Familias",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Cores.corDeTextDentroContainer),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/familias/');
                      },
                    )
                  : Container(
                      color: Colors.grey[100],
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset("assets/start/informacoes.png"),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'A segurança dos dados das famílias cadastradas é muito importante. Para ter acesso você pode criar uma instituição, requisitar um convite, ou entrar em contato com o responsável por uma instituição para que você seja adicionado através de seu número de identificação. Este número está no seu perfil. Até lá, você não terá acesso às informações de nenhuma família cadastrada.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Cores.corDeTextDentroContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
