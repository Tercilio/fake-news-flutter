import 'package:basearch/src/features/main/domain/model/predictions.dart';

class News {
  const News(this.id, this.title, this.body, this.author, this.url,
      this.category, this.publicationDate, this.predictions);

  final int id;
  final String title;
  final String body;
  final String author;
  final String url;
  final String category;
  final String publicationDate;
  final Predictions? predictions;

  factory News.fromJson(Map<String, dynamic> json, Predictions? predictions) =>
      News(json['id'], json['title'], json['body'], json['author'], json['url'],
          json['category'], json['publicationDate'], predictions);
}
