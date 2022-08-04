import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroducaoPage extends StatefulWidget {
  const IntroducaoPage({Key? key}) : super(key: key);

  @override
  State<IntroducaoPage> createState() => _IntroducaoPageState();
}

class _IntroducaoPageState extends State<IntroducaoPage> {
  SecureStorage secureStorage = SecureStorage();
  final PageController controller = PageController();
  int pageIndex = 0;
  bool isLastPage = false;
  bool isNewSetup = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  setPaginaAtual(pagina) {
    setState(() {
      pageIndex = pagina;
      isLastPage = isNewSetup ? (pageIndex == 3) : (pageIndex == 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            PageView(
              controller: controller,
              onPageChanged: setPaginaAtual,
              children: _getChildren(),
            ),
            Container(
                padding: const EdgeInsets.only(top: 46, right: 10),
                child: TextButton(
                    onPressed: () {
                      secureStorage.secureWrite('intro', 'false');
                      Modular.to.navigate('/home/');
                    },
                    child: const Text("não mostrar novamente"))),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? InkWell(
              onTap: () {
                Modular.to.navigate('/home/');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'começar',
                      style: TextStyle(color: Cores.corPrincipal),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Modular.to.navigate('/home/');
                      },
                      child: const Text('pular')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: isNewSetup ? 4 : 3,
                      axisDirection: Axis.horizontal,
                      effect: const ScrollingDotsEffect(
                        spacing: 8.0,
                        radius: 8.0,
                        dotWidth: 24.0,
                        dotHeight: 16.0,
                        paintStyle: PaintingStyle.fill,
                        activeDotColor: Cores.corPrincipal,
                      ),
                      onDotClicked: (index) {
                        controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text('próximo')),
                ],
              ),
            ),
    );
  }

  _getChildren() => <Widget>[
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset("assets/start/bemvindo.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Este é um aplicativo destinado a auxiliar entidades governamentais e não govenramentais no compartilhamento das informações referentes a doações de cestas básicas a famílias em situação de vulnerabilidade social.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Cores.corDeTextDentroContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
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
                  'Você pode criar uma instituição ou entrar em contato com o responsável por uma instituição para que você seja adicionado. Até lá, você não terá acesso às informações de nenhuma família cadastrada.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Cores.corDeTextDentroContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset("assets/start/seguranca.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Como as informações dos integrantes de cada família são sensíveis, novas instituições estão sujeitas a aprovação. A responsabilidade pelo comportamento ético e integro de novos membros é de cada instituição.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Cores.corDeTextDentroContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isNewSetup)
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset("assets/start/share.png"),
                  const SizedBox(
                    height: 20,
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
          ),
      ];
}
