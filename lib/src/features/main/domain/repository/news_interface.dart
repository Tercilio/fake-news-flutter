import 'package:basearch/src/features/main/domain/model/news.dart';

abstract class INews {
  Future<List<News>> getAllNews();
}
