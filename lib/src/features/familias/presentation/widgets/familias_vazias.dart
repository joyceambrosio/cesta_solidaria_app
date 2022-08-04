import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';

class FamiliasVazias extends StatelessWidget {
  const FamiliasVazias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset("assets/start/informacoes.png"),
            ),
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
    );
  }
}
