import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página não encontrada')),
      body: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Lottie.asset('assets/imgs/404-error.json'),
              Center(
                child: ElevatedButton(
                  onPressed: () => Modular.to.navigate('/'),
                  child: const Text('Voltar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Lottie.asset('assets/images/loading.json'),