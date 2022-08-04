import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtomField extends StatelessWidget {
  final String labelText;
  final Color background;
  final Color? textColor;
  final FaIcon? icone;
  final VoidCallback? onClick;

  const ButtomField({
    required this.labelText,
    required this.background,
    this.textColor,
    this.icone,
    this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icone == null) {
      return Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onClick ?? () => {},
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor ?? Cores.white,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(8),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            icon: icone ?? const Icon(Icons.abc),
            style: ElevatedButton.styleFrom(
              primary: background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            label: Text(
              labelText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: textColor ?? Cores.white,
              ),
            ),
            onPressed: onClick ?? () => {},
          ),
        ),
      );
    }
  }
}
