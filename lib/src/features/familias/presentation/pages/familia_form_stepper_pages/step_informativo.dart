import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';

class StepInformativo extends StatelessWidget {
  const StepInformativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Na próxima etapa os integrantes da família serão adicionados. Cada família deverá ter um ou mais responsáveis. Estes serão os únicos que poderão receber as cestas.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Cores.corDeTextDentroContainer,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/imgs/pessoas-doando.png",
              height: 150,
            ),
            const SizedBox(height: 10),
            const Text(
              'É obrigatório que os responsáveis tenham o CPF como documento cadastral. No ato do cadastro, tire uma foto do documento e tenha certeza da validade do mesmo.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Cores.corDeTextDentroContainer,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              "assets/imgs/documento-inspect.png",
              height: 150,
            ),
            const SizedBox(height: 10),
            const Text(
              'Para crianças e demais dependentes o CPF é desejável, mas não é obrigatório. Caso o integrante não possua CPF, deixe o campo em branco e tire uma foto de algum outro documento que comprove a identidade como, por exemplo, a certidão de nascimento.',
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
