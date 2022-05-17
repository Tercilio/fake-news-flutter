import 'package:basearch/src/features/auth/domain/model/user_secure_storage.dart';
import 'package:basearch/src/features/main/domain/model/news.dart';
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

      final Response response = await dio.get('http://localhost:8080/api/news');

      List<dynamic> listResponse = response.data;

      for (var element in listResponse) {
        newsData.add(News.fromJson(element));
      }
    } on DioError catch (e) {
      print(e.message);
    }

    return newsData;
  }
}
