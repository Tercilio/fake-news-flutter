import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class MapaPage extends StatelessWidget {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Mapa"),
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
