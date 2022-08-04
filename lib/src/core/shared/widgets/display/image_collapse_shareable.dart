import 'package:cartallum_app/src/core/shared/mixins/share_handler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageCollapseShareable extends StatelessWidget with ShareHandler {
  final String? imageUrl;
  final String title;
  const ImageCollapseShareable({
    required this.imageUrl,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
    );
  }
}
