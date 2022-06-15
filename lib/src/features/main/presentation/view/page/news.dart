import 'package:basearch/src/features/main/domain/model/news.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final News _news;
  const NewsPage(this._news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(_news.title),
        backgroundColor: const Color.fromARGB(255, 135, 151, 178),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: SingleChildScrollView(
          child: Text(
            _news.body,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
