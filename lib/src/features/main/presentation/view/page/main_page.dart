import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('News 1'),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('News 2'),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('News 3'),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        centerTitle: true,
        title: const Text("Notícias"),
      ),
    );
  }
}
