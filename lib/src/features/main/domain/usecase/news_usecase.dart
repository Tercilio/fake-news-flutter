import 'package:basearch/src/features/main/data/dto/news_detector_output_dto.dart';
import 'package:basearch/src/features/main/domain/model/news.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../repository/news_interface.dart';

class NewsUseCase {
  final repository = Modular.get<INews>();

  Future<List<News>> getAllNews() {
    return repository.getAllNews();
  }

  Future<NewsDetectorOutput> detectorFakeNews(String body) {
    return repository.detectorFakeNews(body);
  }
}
