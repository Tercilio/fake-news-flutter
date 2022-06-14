class NewsDetectorInput {
  const NewsDetectorInput(this.body);

  final String body;

  factory NewsDetectorInput.fromJson(Map<String, dynamic> json) =>
      NewsDetectorInput(json['body']);

  Map<String, dynamic> toJson() => {'body': body};
}
