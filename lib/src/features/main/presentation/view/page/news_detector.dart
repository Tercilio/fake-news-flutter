import 'package:basearch/src/features/main/presentation/viewmodel/news_detector_viewmodel.dart';
import 'package:basearch/src/features/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class NewsDetectorPage extends StatefulWidget {
  const NewsDetectorPage({Key? key}) : super(key: key);

  @override
  State<NewsDetectorPage> createState() => _NewsDetectorPage();
}

class _NewsDetectorPage
    extends ModularState<NewsDetectorPage, NewsDetectorViewModel> {
  final _controller = TextEditingController(text: ' ');
  late ThemeData _themeData;
  late bool isNewsDetected = false;

  Widget get _body => Container(
        margin: const EdgeInsets.fromLTRB(25, 20, 25, 0),
        width: double.infinity,
        child: Scrollbar(
          thickness: 10.0,
          radius: const Radius.circular(20),
          child: TextFormField(
            controller: _controller,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorText: store.error.body,
              labelText: 'body_label'.i18n(),
              hintText: 'body_hint'.i18n(),
              errorStyle: const TextStyle(fontWeight: FontWeight.bold),
              contentPadding: const EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 4.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            enabled: !store.isLoading,
            onChanged: (value) => store.body = value,
          ),
        ),
      );

  Widget get _newsDetectorButton => Container(
        height: 56,
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(180, 56)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            ),
          ),
          onPressed: () async {
            isNewsDetected = await store.detectorFakeNews();
          },
          child: Text('send_news'.i18n()),
        ),
      );

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
          child: Observer(
            builder: (_) {
              return Form(
                child: Column(
                  children: [_body, _newsDetectorButton],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
