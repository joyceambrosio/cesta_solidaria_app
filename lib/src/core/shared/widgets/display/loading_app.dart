import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: Utils.paddingPadrao,
          child: Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: Lottie.asset('assets/imgs/loading.json'),
            ),
          )),
    );
  }
}
