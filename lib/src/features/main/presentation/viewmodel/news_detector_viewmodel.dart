import 'package:basearch/src/features/main/data/dto/news_detector_output_dto.dart';
import 'package:basearch/src/features/main/domain/usecase/news_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'news_detector_viewmodel.g.dart';

class NewsDetectorViewModel = _NewsDetectorViewModelBase
    with _$NewsDetectorViewModel;

abstract class _NewsDetectorViewModelBase with Store {
  final error = NewsDetectorError();
  final _usecase = Modular.get<NewsUseCase>();

  @observable
  String body = "";

  @observable
  bool isNewsDetected = false;

  @observable
  bool isLoading = false;

  @action
  void validateBody() {
    error.body = _usecase.validateBody(body);
  }

  Future<bool> detectorFakeNews() async {
    error.clear();

    validateBody();

    if (!error.hasErrors) {
      isLoading = true;
      isNewsDetected = false;

      try {
        NewsDetectorOutput detectorOutput =
            await _usecase.detectorFakeNews(body);

        isNewsDetected = true;
        return detectorOutput.predictions!.veracity == 0 ? false : true;
      } on Exception catch (erro) {
        print("Erro ao detectar a notícias: " + erro.toString());
      } finally {
        isLoading = false;
      }
    }

    return false;
  }
}

class NewsDetectorError = _NewsDetectorErrorBase with _$NewsDetectorError;

abstract class _NewsDetectorErrorBase with Store {
  @observable
  String? body;

  @computed
  bool get hasErrors => body != null;

  void clear() {
    body = null;
  }
}
