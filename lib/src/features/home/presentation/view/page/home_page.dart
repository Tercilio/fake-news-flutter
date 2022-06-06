import 'dart:async';

import 'package:basearch/src/features/onboarding/presentation/view/page/onboarding_page.dart';
import 'package:basearch/src/features/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: const Center(
        child: Visibility(
          child: RefreshProgressIndicator(
            backgroundColor: Colors.blueGrey,
          ),
        ),
      ),
    );

class _HomePageState extends State<HomePage> {
  // late ThemeChanger themeChanger;
  // late bool systemIsDark;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   themeChanger.setDarkStatus(systemIsDark);
    // });

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    // systemIsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // bool darkThemeEnabled = Provider.of<ThemeChanger>(context).isDak();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(child: _logo, flex: 2),
            Expanded(child: _loading)
          ],
        ),
      ),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()));
  }
}
