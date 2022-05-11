class News {
  const News(this.id, this.title, this.body, this.author, this.url,
      this.category, this.publicationDate);

  final int id;
  final String title;
  final String body;
  final String author;
  final String url;
  final String category;
  final String publicationDate;

  factory News.fromJson(Map<String, dynamic> json) => News(
      json['id'],
      json['title'],
      json['body'],
      json['author'],
      json['url'],
      json['category'],
      json['publicationDate']);
}
