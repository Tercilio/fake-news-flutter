import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'forgotpassword_viewmodel.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {

  @observable
  String email = '';

  @observable
  bool isLoading = false;

  @action
  void validateEmail() {
   // error.username = _usecase.validateUsername(username);
  }


  void send() async {
  }
}