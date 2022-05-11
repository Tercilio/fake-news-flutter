import 'package:basearch/src/features/auth/domain/model/news.dart';
import 'package:basearch/src/features/auth/presentation/view/page/login_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<News> newsData = [
    const News(
        1, "Title1", "Body1", "Author1", "google.com", "T", "2000-10-09"),
    const News(
        2, "Title2", "Body2", "Author2", "google.com", "T", "2000-10-09"),
    const News(
        3, "Title3", "Body1", "Author1", "google.com", "T", "2000-10-09"),
    const News(
        4, "Title4", "Body2", "Author2", "google.com", "T", "2000-10-09"),
    const News(
        5, "Title5", "Body1", "Author1", "google.com", "T", "2000-10-09"),
    const News(
        6, "Title6", "Body2", "Author2", "google.com", "T", "2000-10-09"),
    const News(
        7, "Title7", "Body1", "Author1", "google.com", "T", "2000-10-09"),
    const News(
        8, "Title8", "Body2", "Author2", "google.com", "T", "2000-10-09"),
    const News(
        9, "Title9", "Body1", "Author1", "google.com", "T", "2000-10-09"),
    const News(
        10, "Title10", "Body2", "Author2", "google.com", "T", "2000-10-09"),
    const News(
        11, "Title11", "Body1", "Author1", "google.com", "T", "2000-10-09"),
    const News(
        12, "Title12", "Body2", "Author2", "google.com", "T", "2000-10-09"),
  ];

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
      itemCount: newsData.length,
      itemBuilder: (context, index) {
        return newsCard(context, newsData[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listView(context),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        centerTitle: true,
        title: const Text("Notícias"),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              semanticLabel: 'logout',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
