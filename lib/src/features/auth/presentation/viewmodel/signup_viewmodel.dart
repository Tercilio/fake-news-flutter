import 'package:basearch/src/exceptions/singup_exception.dart';
import 'package:basearch/src/features/auth/data/dto/user_input_dto.dart';
import 'package:basearch/src/features/auth/domain/usecase/signup_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';

part 'signup_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  final error = SingUpError();
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

  @observable
  bool isAccountCreated = false;

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

  Future<bool> singup() async {
    error.clear();

    validateFullname();
    validateEmail();
    validatePassword();
    validateBirthdate();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        UserInputDto userInputDto =
            await _usecase.singup(fullname, birthdate, email, password);

        if (userInputDto.email.isNotEmpty) {
          return true;
        }
      } on SingUpException {
        error.signup = 'singup_invalid'.i18n();
      } on Exception {
        error.signup = 'singup_invalid'.i18n();
      } finally {
        isLoading = false;
      }
    }
    return false;
  }
}

class SingUpError = _SingUpErrorBase with _$SingUpError;

abstract class _SingUpErrorBase with Store {
  @observable
  String? fullname;

  @observable
  String? birthdate;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String signup = '';

  @computed
  bool get hasErrors =>
      fullname != null ||
      password != null ||
      email != null ||
      birthdate != null ||
      signup.isNotEmpty;

  void clear() {
    fullname = null;
    email = null;
    password = null;
    birthdate = null;
    signup = '';
  }
}
