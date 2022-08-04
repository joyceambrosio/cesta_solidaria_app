import 'package:cartallum_app/src/features/users/presentation/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:lottie/lottie.dart';

class LogoutPage extends StatefulWidget {
  final AuthController controller = Modular.get<AuthController>();
  LogoutPage({Key? key}) : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  void initState() {
    widget.controller.logout();
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((_) {
      Modular.to.navigate('/auth/');
      //Modular.to.pushReplacementNamed('/home/');
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
