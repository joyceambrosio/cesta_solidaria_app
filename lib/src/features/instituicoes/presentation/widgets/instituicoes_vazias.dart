import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';

class InstituicoesVazias extends StatelessWidget {
  const InstituicoesVazias({Key? key}) : super(key: key);

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
              child: Image.asset("assets/start/share.png"),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Como não existem instituições cadastradas, o usuário que criar uma instituição se tornará administrador e a instituição será considerada a matriz. Todas as outras instituições estarão sujeitas às regras por ela configuradas.',
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
