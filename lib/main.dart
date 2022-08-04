import 'package:cartallum_app/src/core/modules/app_module.dart';
import 'package:cartallum_app/src/core/modules/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ModularApp(
    module: AppModule(),
    // ignore: prefer_const_constructors
    child: AppWidget(),
  ));
}
