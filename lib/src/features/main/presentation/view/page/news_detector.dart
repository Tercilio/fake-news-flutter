import 'package:basearch/src/features/main/presentation/viewmodel/news_detector_viewmodel.dart';
import 'package:basearch/src/features/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class NewsDetectorPage extends StatefulWidget {
  const NewsDetectorPage({Key? key}) : super(key: key);

  @override
  State<NewsDetectorPage> createState() => _NewsDetectorPage();
}

class _NewsDetectorPage
    extends ModularState<NewsDetectorPage, NewsDetectorViewModel> {
  late ThemeData _themeData;

  @override
  Widget build(BuildContext context) {
    bool darkThemeEnabled = Provider.of<ThemeChanger>(context).isDark;

    _themeData = darkThemeEnabled ? ThemeData.dark() : ThemeData.light();

    return MaterialApp(
      theme: _themeData,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("Fake News detector"),
          leading: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: _themeData.iconTheme.color,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Observer(builder: (_) {
              return Form(child: Column());
            }),
          ),
        ),
      ),
    );
  }
}
