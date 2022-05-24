import 'package:basearch/src/exceptions/login_exception.dart';
import 'package:basearch/src/features/auth/data/dto/user_output_dto.dart';
import 'package:basearch/src/features/auth/domain/model/user_secure_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecase/login_usecase.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final error = LoginError();
  final _usecase = Modular.get<LoginUseCase>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool isLogged = false;

  @action
  void validateEmail() {
    error.email = _usecase.validateEmail(email);
  }

  @action
  void validatePassword() {
    error.password = _usecase.validatePassword(password);
  }

  void login() async {
    error.clear();

    validateEmail();
    validatePassword();

    if (!error.hasErrors) {
      isLoading = true;
      try {
        UserOutputDto user = await _usecase.login(email, password);

        if (user.token == null) throw Exception();

        UserSecureStorage.setUser(user);

        isLogged = true;
        Modular.to.pushNamed('/main');
      } on LoginException {
        error.login = 'login_invalid'.i18n();
      } on Exception {
        error.login = 'login_server_error'.i18n();
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

  @observable
  String? password;

  @observable
  String login = '';

  @computed
  bool get hasErrors => email != null || password != null || login.isNotEmpty;

  void clear() {
    email = null;
    password = null;
    login = '';
  }
}
