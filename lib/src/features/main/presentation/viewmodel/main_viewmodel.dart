import 'package:basearch/src/features/main/domain/model/news.dart';
import 'package:basearch/src/features/main/domain/usecase/news_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'main_viewmodel.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  final _newsusecase = Modular.get<NewsUseCase>();

  @observable
  List<News> newsData = [];

  @observable
  bool isLoading = true;

  Future<List<News>> getAllNews() async {
    try {
      newsData = await _newsusecase.getAllNews();
      isLoading = false;
    } on Exception catch (erro) {
      print("Erro ao carregar as notícias: " + erro.toString());
    } finally {
      isLoading = false;
    }
    return newsData;
  }
}
