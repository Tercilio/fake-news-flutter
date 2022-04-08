import 'package:basearch/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signup_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  final error = LoginError();
  final _usecase = Modular.get<SignUpUseCase>();

  @observable
  String fullname = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void validateFullname() {
    error.fullname = _usecase.validateFullname(fullname);
  }

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  void saveUser() {
    error.clear();

    validateFullname();
    validateEmail();
    validatePassword();
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? fullname;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => fullname != null || password != null || email != null;

  void clear() {
    fullname = null;
    email = null;
    password = null;
  }
}
