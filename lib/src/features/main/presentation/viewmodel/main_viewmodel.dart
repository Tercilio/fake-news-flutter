import 'package:basearch/src/features/main/domain/model/news.dart';
import 'package:basearch/src/features/main/domain/usecase/news_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_viewmodel.g.dart';

class MainViewModel = _MainViewModelBase with _$MainViewModel;

abstract class _MainViewModelBase with Store {
  _MainViewModelBase() {
    loadTheme();
  }

  final _newsusecase = Modular.get<NewsUseCase>();

  @observable
  List<News> newsData = [];

  @observable
  ThemeData themeType = ThemeData.dark();

  @observable
  bool isLoading = true;

  @computed
  bool get isDark => themeType.brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      themeType = ThemeData.light();
    } else {
      themeType = ThemeData.dark();
    }
    saveThemePreferences();
  }

  void saveThemePreferences() {
    SharedPreferences.getInstance().then((instance) {
      instance.setBool('isDark', isDark);
    });
  }

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

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    bool? isDarkP = prefs.getBool('isDark');

    if (isDarkP != null && isDarkP == true) {
      themeType = ThemeData.dark();
    } else {
      themeType = ThemeData.light();
    }
  }
}
