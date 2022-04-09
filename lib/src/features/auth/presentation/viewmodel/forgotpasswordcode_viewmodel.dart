import 'package:mobx/mobx.dart';

part 'forgotpasswordcode_viewmodel.g.dart';

class ForgotPasswordCodeViewModel = _ForgotPasswordCodeViewModelBase with _$ForgotPasswordCodeViewModel;

abstract class _ForgotPasswordCodeViewModelBase with Store {

  @observable
  String code = '';

  @observable
  bool isLoading = false;

  @action
  void validateEmail() {
   // error.username = _usecase.validateUsername(username);
  }


  void send() async {
  }
}