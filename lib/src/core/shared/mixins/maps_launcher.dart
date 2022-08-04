import 'package:maps_launcher/maps_launcher.dart';

mixin MapLauncher {
  launchCoords(double latitude, double longitude) {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }

  launchEndereco(String endereco) {
    MapsLauncher.launchQuery(endereco);
  }
}
