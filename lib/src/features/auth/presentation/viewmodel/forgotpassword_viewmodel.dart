import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/forgotpassword_usecase.dart';

part 'forgotpassword_viewmodel.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  final error = LoginError();
  final _usecase = Modular.get<ForgotPasswordUseCase>();

  @observable
  String email = '';

  @observable
  bool isLoading = false;

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

Future<void> sendEmail() async {
    error.clear();

    validateEmail();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await Future.delayed(const Duration(seconds: 10));
      } on UnimplementedError {
        error.email = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
    }
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? email;

  @computed
  bool get hasErrors => email != null;

  void clear() {
    email = null;
  }
}
