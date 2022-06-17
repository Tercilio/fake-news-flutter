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
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import 'mapa_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ModularState<MainPage, MainViewModel> {
  final UserOutputDto _user = UserSecureStorage.getUser();
  late GlobalKey refreshkey = GlobalKey<RefreshIndicatorState>();
  late ThemeChanger themeChanger;
  late List<News> newsData = [];
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
      itemCount: newsData.length,
      itemBuilder: (context, index) => _newsCard(context, newsData[index]),
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
                child: Text(
                  _user.fullname.isEmpty ? "" : _user.fullname[0],
                  style: const TextStyle(fontSize: 40.0),
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
            title: Text('profile_bar'.i18n()),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfilePage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: Text('fakenews_detector_bar'.i18n()),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewsDetectorPage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_rounded),
            title: Text('chatbot_bar'.i18n()),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatbotPage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.map_rounded),
            title: Text('maps_bar'.i18n()),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapaPage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_rounded),
            title: Text('leave_bar'.i18n()),
            onTap: () => {
              UserSecureStorage.resetUser(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshListNews();
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
        drawer: _drawer(context),
        appBar: AppBar(
          backgroundColor: darkThemeEnabled
              ? ThemeData.dark().backgroundColor
              : const Color.fromARGB(255, 135, 151, 178),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.update_rounded),
              onPressed: () => _refreshListNews(),
            )
          ],
          centerTitle: true,
          title: Text('news_bar'.i18n()),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshListNews,
          key: refreshkey,
          child: store.isLoading ? _loading : _listView(context),
        ),
      ),
    );
  }

  Future<void> _refreshListNews() async {
    List<News> list = await store.getAllNews();

    setState(() => newsData = list);
  }
}
