import 'package:basearch/src/features/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

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
    bool isDark = Provider.of<ThemeChanger>(context, listen: false).isDark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('maps_bar'.i18n()),
        backgroundColor: isDark
            ? ThemeData.dark().backgroundColor
            : const Color.fromARGB(255, 135, 151, 178),
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
