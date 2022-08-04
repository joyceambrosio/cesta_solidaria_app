import 'package:cartallum_app/src/features/cesta/domain/entities/local_entity.dart';
import 'package:geolocator/geolocator.dart';

mixin CoordinatesHandler {
  Future<Local?> getPosicao() async {
    List<double> coords = [];
    Position posicao;
    try {
      posicao = await _determinePosition();
      coords.add(posicao.longitude);
      coords.add(posicao.latitude);
      Local local = Local(coordinates: coords);
      return local;
    } catch (e) {
      return null;
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Future.error('GPS desativado');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Future.error('Permissões de local foram negadas');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Future.error('Permissões de local foram permanentemente negadas');
    }
    return await Geolocator.getCurrentPosition();
  }
}
