import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  final String imageUrl;
  const ImageProfile({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.width * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        padding: Utils.paddingPadrao,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * 0.6 / 2),
          child: Image.network(imageUrl, fit: BoxFit.fill, errorBuilder: (
            BuildContext context,
            Object exception,
            StackTrace? stackTrace,
          ) {
            return Image.asset('assets/imgs/default.jpg');
          }, loadingBuilder: (
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
          }),
        ));
  }
}
