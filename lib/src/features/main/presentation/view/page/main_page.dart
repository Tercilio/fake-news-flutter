import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/domain/model/user.dart';
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

  Widget _drawer(BuildContext context, UserInputDto user) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              accountName: Text(user.fullname),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  user.fullname[0],
                  style: const TextStyle(fontSize: 40.0),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/images/noite.jpg'),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favorites'),
            subtitle: const Text('my favorites...'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            subtitle: const Text('my profile...'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            subtitle: const Text('my feedbacks...'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildFutureBuilder(),
      drawer: _drawer(context,
          const UserInputDto("Welisson", "2022-05-17", "w@gmail.com", "")),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        centerTitle: true,
        title: const Text("Notícias"),
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
