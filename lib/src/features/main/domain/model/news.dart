class News {
  const News(this.id, this.veracit, this.title, this.body, this.author,
      this.url, this.category, this.publicationDate);

  final int id;
  final bool? veracit;
  final String title;
  final String body;
  final String author;
  final String url;
  final String category;
  final String publicationDate;

  factory News.fromJson(Map<String, dynamic> json) => News(
      json['id'],
      json['veracity'],
      json['title'],
      json['body'],
      json['author'],
      json['url'],
      json['category'],
      json['publicationDate']);
}
