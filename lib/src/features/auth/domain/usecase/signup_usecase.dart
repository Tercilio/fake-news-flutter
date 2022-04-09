import 'package:localization/localization.dart';

class SignUpUseCase {
  String? validateFullname(String fullname) {
    if (fullname.isEmpty) {
      return 'fullname_required'.i18n();
    }

    return null;
  }

  String? validateBirthdate(String birthdate) {
    if (birthdate.isEmpty) {
      return 'birthdate_required'.i18n();
    }
    return null;
  }

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
}
