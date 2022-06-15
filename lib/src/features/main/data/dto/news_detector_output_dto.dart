import 'package:basearch/src/features/main/domain/model/predictions.dart';

class NewsDetectorOutput {
  const NewsDetectorOutput(this.body, this.predictions);

  final String body;
  final Predictions? predictions;

  factory NewsDetectorOutput.fromJson(Map<String, dynamic> json) =>
      NewsDetectorOutput(json['body'], json['predictions']);
}
