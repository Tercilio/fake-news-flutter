import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/forgotpassword_usecase.dart';

part 'validatorcode_viewmodel.g.dart';

class ValidatorCodeViewModel = _ValidatorCodeViewModelBase with _$ValidatorCodeViewModel;

abstract class _ValidatorCodeViewModelBase with Store {
  final error = LoginError();
  final _usecase = Modular.get<ForgotPasswordUseCase>();

  @observable
  String password = '';
  String confirmePassword = '';

  @observable
  bool isLoading = false;

  @action
  void validatePassword() {
   error.password = _usecase.validateNewPassword(password, confirmePassword);
  }

 Future<void> changePassword() async {
    error.clear();
    validatePassword();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await Future.delayed(const Duration(seconds: 10));
      } on UnimplementedError {
        error.password = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
    }
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? password;

  String? confirmePassword;

  @computed
  bool get hasErrors =>
     
      password != null || confirmePassword != null;

  void clear() {
    password = null;
    confirmePassword = null; 
  }
}