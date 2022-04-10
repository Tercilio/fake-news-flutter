import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget get _logo => Container(
    width: double.infinity,
    height: double.infinity,
    color: const Color.fromARGB(255, 93, 113, 128),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage('lib/assets/images/logo.png'),
          height: 160,
        ),
        Image(
          image: AssetImage('lib/assets/images/removebg_grey.png'),
          height: 75,
        )
      ],
    ));

Widget get _loading => Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.black,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(image: AssetImage('lib/assets/images/loading.gif'))
      ],
    ));

class _HomePageState extends State<HomePage> {
  late ColorScheme _colors;
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _colors = _theme.colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [Expanded(child: _logo, flex: 2), Expanded(child: _loading)],
      ),
    );
  }
}
