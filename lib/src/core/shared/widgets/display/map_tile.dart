import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapTile extends StatelessWidget {
  final MapController controller;
  final LatLng center;
  final List<Marker> markers;
  const MapTile({
    required this.controller,
    required this.center,
    required this.markers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 600,
      child: FlutterMap(
        mapController: controller,
        options: MapOptions(
          center: center,
          zoom: 18,
          maxZoom: 18,
          interactiveFlags: InteractiveFlag.all,
          enableScrollWheel: true,
          scrollWheelVelocity: 0.005,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayerOptions(markers: markers)
        ],
        // nonRotatedChildren: [
        //   AttributionWidget.defaultWidget(
        //     source: 'OpenStreetMap contributors',
        //     onSourceTapped: () {},
        //   ),
        // ],
      ),
    );
  }
}
