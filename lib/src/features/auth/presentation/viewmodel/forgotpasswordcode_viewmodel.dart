import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/forgotpassword_usecase.dart';

part 'forgotpasswordcode_viewmodel.g.dart';

class ForgotPasswordCodeViewModel = _ForgotPasswordCodeViewModelBase
    with _$ForgotPasswordCodeViewModel;

abstract class _ForgotPasswordCodeViewModelBase with Store {
  final error = LoginError();
  final _usecase = Modular.get<ForgotPasswordUseCase>();

  @observable
  String code = '';

  @observable
  bool isLoading = false;

  @action
  void validateCode() {
    error.code = _usecase.validateCode(code);
  }

  Future<void> sendEmail() async {
    error.clear();

    validateCode();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await Future.delayed(const Duration(seconds: 10));
      } on UnimplementedError {
        error.code = '';
      } finally {
        isLoading = false;
      }
    }
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? code;

  @computed
  bool get hasErrors => code != null;

  void clear() {
    code = null;
  }
}
