import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/mixins/share_handler.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageTileCollapse extends StatelessWidget with ShareHandler {
  final String? imageUrl;
  final String title;
  const ImageTileCollapse({
    required this.imageUrl,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return const SizedBox();
    }
    if (imageUrl!.isEmpty) {
      return const SizedBox();
    }
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
          trailing: const FaIcon(FontAwesomeIcons.fileCircleCheck),
        ),
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                imageUrl!,
                fit: BoxFit.contain,
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return Image.asset('assets/imgs/logo_limpa.png');
                },
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  shareFileFromUrl(imageUrl!, 'Texto');
                },
                icon: const FaIcon(FontAwesomeIcons.shareNodes),
              )
            ],
          ),
        ],
      ),
    );
  }
}
