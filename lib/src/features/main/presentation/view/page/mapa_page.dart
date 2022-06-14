import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  late GoogleMapController mapaController;
  double lat = -15.7750655;
  double long = -48.0773266;

  get _onMapaCreated => null;

  void onMapaCreated(GoogleMapController controller) {
    mapaController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Google Maps"),
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GoogleMap(
        onMapCreated: _onMapaCreated,
        onCameraMove: (data) {
          // ignore: avoid_print
          print(data);
        }, //
        onTap: (position) {
          // ignore: avoid_print
          print(position);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 11.0,
        ),
      ),
    );
  }
}
