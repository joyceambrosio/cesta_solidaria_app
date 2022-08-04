import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:share_plus/share_plus.dart';

mixin ShareHandler {
  shareFileFromUrl(String url, String texto) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    Share.shareFiles([file.path], text: texto);
  }

  shareFileFromPath(String path, String texto) async {
    Share.shareFiles([path], text: texto);
  }
}
