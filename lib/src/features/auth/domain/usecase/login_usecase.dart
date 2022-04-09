import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../model/user.dart';
import '../repository/login_interface.dart';

class LoginUseCase {
  final repository = Modular.get<ILogin>();

  String? validateEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);

    if (email.isEmpty) {
      return 'email_required'.i18n();
    } else if (!regExp.hasMatch(email)) {
      return 'email_invalid'.i18n();
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'password_required'.i18n();
    }
    return null;
  }

  // Future<User> login(String email, String password) {
  //   return repository.login(User(email, password));
  // }
}