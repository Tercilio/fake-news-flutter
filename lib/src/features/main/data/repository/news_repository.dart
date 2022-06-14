import 'package:basearch/src/features/auth/domain/model/user_secure_storage.dart';
import 'package:basearch/src/features/main/data/dto/news_detector_input_dto.dart';
import 'package:basearch/src/features/main/data/dto/news_detector_output_dto.dart';
import 'package:basearch/src/features/main/domain/model/news.dart';
import 'package:basearch/src/features/main/domain/model/predictions.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/news_interface.dart';

class NewsRepository implements INews {
  @override
  Future<List<News>> getAllNews() async {
    Dio dio = Dio();

    List<News>? newsData = [];

    try {
      dio.options.headers["Authorization"] =
          "Bearer " + UserSecureStorage.getUsertoken();

      final Response response =
          await dio.get('https://api-fakenews.herokuapp.com/api/news');

      List<dynamic> listResponse = response.data;

      for (var element in listResponse) {
        Predictions predictions;

        if (element["predictions"] != null) {
          predictions = Predictions.fromJson(element["predictions"]);
          newsData.add(News.fromJson(element, predictions));
        } else {
          newsData.add(News.fromJson(element, null));
        }
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }

    return newsData;
  }

  @override
  Future<NewsDetectorOutput> detectorFakeNews(String body) async {
    NewsDetectorInput detector = NewsDetectorInput(body);
    Dio dio = Dio();

    try {
      dio.options.headers["Authorization"] =
          "Bearer " + UserSecureStorage.getUsertoken();

      final response = await dio.put(
        'https://api-fakenews.herokuapp.com/api/news/predict',
        data: detector.toJson(),
      );

      final Map<String, dynamic> json = Map.from(response.data);

      return NewsDetectorOutput.fromJson(json);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
