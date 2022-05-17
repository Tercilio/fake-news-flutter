import 'package:basearch/src/features/auth/presentation/view/page/login_page.dart';
import 'package:basearch/src/features/main/presentation/viewmodel/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ModularState<MainPage, MainViewModel> {

  Widget get _loading => const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Visibility(
            child: RefreshProgressIndicator(
              backgroundColor: Colors.blueGrey,
            ),
          ),
        ),
      );

  Widget newsCard(context, news) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Card(
        borderOnForeground: true,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.article,
                size: 35,
              ),
              title: Text(news.title, style: const TextStyle(fontSize: 16)),
              subtitle: Text(news.body, style: const TextStyle(fontSize: 12)),
              onTap: () {
                print(news.title);
              },
            ),
          ],
        ),
      ),
    );
  }

  ListView _listView(BuildContext context) {
    return ListView.builder(
      itemCount: store.newsData.length,
      itemBuilder: (context, index) {
        return newsCard(context, store.newsData[index]);
      },
    );
  }

  _buildFutureBuilder() {
    return FutureBuilder(
      future: store.getAllNews(),
      builder: (context, snaphot) {
        switch (snaphot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return _loading;
          default:
            if (snaphot.hasData) {
              return _listView(context);
            } else {
              return const Center(child: Text("Erro ao carregar."));
            }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildFutureBuilder(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        centerTitle: true,
        title: const Text("Notícias"),
        leading: IconButton(
          icon: const Icon(Icons.menu, semanticLabel: 'menu'),
          onPressed: () => print('Menu button'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, semanticLabel: 'logout'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ),
          )
        ],
      ),
    );
  }
}