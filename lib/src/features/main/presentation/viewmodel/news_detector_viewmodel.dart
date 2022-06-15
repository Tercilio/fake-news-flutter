import 'package:basearch/src/features/main/data/dto/news_detector_output_dto.dart';
import 'package:basearch/src/features/main/domain/usecase/news_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'news_detector_viewmodel.g.dart';

class NewsDetectorViewModel = _NewsDetectorViewModelBase
    with _$NewsDetectorViewModel;

abstract class _NewsDetectorViewModelBase with Store {
  final _detectorusecase = Modular.get<NewsUseCase>();

  @observable
  String body = "";

  @observable
  bool isLoading = true;

  Future<bool> detectorFakeNews() async {
    try {
      NewsDetectorOutput detectorOutput =
          await _detectorusecase.detectorFakeNews(body);
      isLoading = false;

      return detectorOutput.predictions!.veracity == 0 ? false : true;
    } on Exception catch (erro) {
      print("Erro ao detectar a notícias: " + erro.toString());
    } finally {
      isLoading = false;
    }

    return false;
  }
}
