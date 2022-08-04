import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoadingErrorApp extends StatelessWidget {
  final String errorMsg;
  const LoadingErrorApp({required this.errorMsg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.paddingPadrao,
      child: Column(
        children: [
          const Center(
            child: FaIcon(
              FontAwesomeIcons.exclamation,
              color: Colors.red,
              size: 60,
            ),
          ),
          Padding(
            padding: Utils.paddingPadrao,
            child: Text('Houve um erro ao carregar os dados. $errorMsg'),
          )
        ],
      ),
    );
  }
}
