import 'dart:io';

import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/mixins/share_handler.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ImageTileCollapseRemovable extends StatelessWidget with ShareHandler {
  final XFile file;
  final String title;
  final VoidCallback onClick;
  const ImageTileCollapseRemovable({
    required this.file,
    required this.title,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          Shadows.muitoLeve(),
        ],
        borderRadius: Utils.arredondamentoPadrao,
        color: Cores.white,
      ),
      width: double.infinity,
      margin: Utils.marginPadrao,
      padding: Utils.paddingPadrao,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        title: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.file(
                File(file.path),
                fit: BoxFit.fitWidth,
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return Image.asset('assets/imgs/logo_limpa.png');
                },
              ),
              IconButton(
                onPressed: onClick,
                icon: const FaIcon(FontAwesomeIcons.xmark),
                color: Cores.corPrincipal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
