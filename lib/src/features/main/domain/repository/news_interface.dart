import 'package:basearch/src/features/main/data/dto/news_detector_output_dto.dart';
import 'package:basearch/src/features/main/domain/model/news.dart';

abstract class INews {
  Future<List<News>> getAllNews();
  Future<NewsDetectorOutput> detectorFakeNews(String body);
}
