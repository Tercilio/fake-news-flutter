import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:basearch/src/features/auth/domain/model/user_secure_storage.dart';
import 'package:basearch/src/features/auth/presentation/view/page/login_page.dart';
import 'package:basearch/src/features/main/domain/model/news.dart';
import 'package:basearch/src/features/main/presentation/view/page/chatbot_page.dart';
import 'package:basearch/src/features/main/presentation/view/page/news.dart';
import 'package:basearch/src/features/main/presentation/view/page/news_detector.dart';
import 'package:basearch/src/features/main/presentation/view/page/user_profile.dart';
import 'package:basearch/src/features/main/presentation/viewmodel/main_viewmodel.dart';
import 'package:basearch/src/features/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'mapa_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ModularState<MainPage, MainViewModel> {
  final UserOutputDto _user = UserSecureStorage.getUser();
  late ThemeChanger themeChanger;
  late bool systemIsDark;

  Widget get _loading => const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Visibility(
            child: RefreshProgressIndicator(
              backgroundColor: Color.fromARGB(255, 135, 151, 178),
            ),
          ),
        ),
      );

  Widget get _fakeNewsIcon => SizedBox(
        height: 40,
        width: 40,
        child: Image.asset("lib/assets/images/fake_news_soft.png"),
      );

  Widget get _trueNewsIcon => SizedBox(
        height: 40,
        width: 40,
        child: Image.asset("lib/assets/images/true_news_soft.png"),
      );

  Widget get _themeRowIcon => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                themeChanger.setDarkStatus(false);
              },
              child: Icon(
                Icons.light_mode_outlined,
                color: themeChanger.isDark ? Colors.grey : Colors.black,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                themeChanger.setDarkStatus(true);
              },
              child: Icon(
                Icons.dark_mode_outlined,
                color: themeChanger.isDark ? Colors.white : Colors.grey,
                size: 25,
              ),
            )
          ],
        ),
      );

  Widget _newsCard(context, News news) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        child: SizedBox(
          height: 60,
          child: ListTile(
            leading: news.predictions == null
                ? _fakeNewsIcon
                : news.predictions!.veracity == 0
                    ? _fakeNewsIcon
                    : _trueNewsIcon,
            title: Text(news.title,
                style: const TextStyle(fontSize: 16), maxLines: 1),
            subtitle: Text(news.body,
                style: const TextStyle(fontSize: 12), maxLines: 2),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsPage(news)));
            },
          ),
        ),
      ),
    );
  }

  ListView _listView(BuildContext context) {
    return ListView.builder(
      itemCount: store.newsData.length,
      itemBuilder: (context, index) {
        return _newsCard(context, store.newsData[index]);
      },
    );
  }

  _buildFutureBuilder() {
    return FutureBuilder(
      future: store.newsData.isEmpty ? store.getAllNews() : store.getNewsData(),
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

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              accountName: Text(_user.fullname),
              accountEmail: Text(_user.email),
              currentAccountPicture: CircleAvatar(
                child: _user.photo.isEmpty
                    ? Text(
                        _user.fullname.isEmpty ? "" : _user.fullname[0],
                        style: const TextStyle(fontSize: 40.0),
                      )
                    : ClipOval(
                        child: Image.network(
                          _user.photo,
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('lib/assets/images/profile_bg.jpg'),
                ),
              ),
            ),
          ),
          _themeRowIcon,
          ListTile(
            leading: const Icon(Icons.person_rounded),
            title: const Text('Perfil'),
            subtitle: const Text('meu perfil...'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfilePage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: const Text('Fake News detector'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewsDetectorPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_rounded),
            title: const Text('Chatbot'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatbotPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.map_rounded),
            title: const Text('Mapa'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapaPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_rounded),
            title: const Text('Sair'),
            onTap: () => {
              UserSecureStorage.resetUser(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              ),
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    systemIsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    bool darkThemeEnabled = Provider.of<ThemeChanger>(context).isDark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: _buildFutureBuilder(),
        drawer: _drawer(context),
        appBar: AppBar(
          backgroundColor: darkThemeEnabled
              ? ThemeData.dark().backgroundColor
              : const Color.fromARGB(255, 135, 151, 178),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
          centerTitle: true,
          title: const Text("Notícias"),
        ),
      ),
    );
  }
}
