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
  String birthdate = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool isDateSelected = false;

  @action
  void validateFullname() {
    error.fullname = _usecase.validateFullname(fullname);
  }

  @action
  void validateBirthdate() {
    error.birthdate = _usecase.validateBirthdate(birthdate);
  }

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  Future<void> saveUser() async {
    error.clear();

    validateFullname();
    validateEmail();
    validatePassword();
    validateBirthdate();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        await Future.delayed(const Duration(seconds: 10));
      } on UnimplementedError {
        error.signup = 'Função não implementada!';
      } finally {
        isLoading = false;
      }
    }
  }
}

class LoginError = _LoginErrorBase with _$LoginError;

abstract class _LoginErrorBase with Store {
  @observable
  String? fullname;

  @observable
  String? birthdate;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? signup;

  @computed
  bool get hasErrors =>
      fullname != null ||
      password != null ||
      email != null ||
      birthdate != null ||
      signup != null;

  void clear() {
    fullname = null;
    email = null;
    password = null;
    birthdate = null;
    signup = null;
  }
}
