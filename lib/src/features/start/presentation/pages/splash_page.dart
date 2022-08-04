import 'package:cartallum_app/src/core/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((_) async {
      final abc = await secureStorage.secureRead('intro');
      if (abc == 'false') {
        Modular.to.navigate('/home/');
      } else {
        Modular.to.navigate('/start/intro');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Lottie.asset('assets/imgs/loading.json'),
    ));
  }
}
