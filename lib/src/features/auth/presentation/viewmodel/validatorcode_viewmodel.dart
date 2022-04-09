import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'validatorcode_viewmodel.g.dart';

class ValidatorCodeViewModel = _ValidatorCodeViewModelBase with _$ValidatorCodeViewModel;

abstract class _ValidatorCodeViewModelBase with Store {

  @observable
  String password = '';
  String confirmePassword = '';

  @observable
  bool isLoading = false;

  @action
  void validateEmail() {
   // error.username = _usecase.validateUsername(username);
  }


  void send() async {
  }
}